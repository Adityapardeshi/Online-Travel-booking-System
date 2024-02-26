package com.example.demo;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.StandardMultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mysql.cj.jdbc.Blob;

@Controller
public class CustomerController 
{
	@Autowired
	CustomerService cc;
	
	@Autowired
	AdminService adService;
	
	@RequestMapping("/")
	public String one()
	{
		return "CustLogin";
	}
	
	@RequestMapping(value="/savedata",method=RequestMethod.POST)
	public String two(@ModelAttribute("st") Customer ct, @RequestParam("cpass") String cpass)
	{
		
		if(ct.getPass().equals(cpass))
		{
			cc.register(ct);
		}
		
		return "redirect:/login";
		
	}
	
	@RequestMapping("/login")
	public String login()
	{
		return "CustLogin";
	}
	
	@RequestMapping("/register")
	public String reg()
	{
		return "CustRegister";
	}
	
	@PostMapping("/CheckData")
	public String check(@RequestParam("email") String email,@RequestParam("pass") String pass, HttpSession s1, RedirectAttributes redirectAttributes)
	{
		Customer c=cc.checkcred(email,pass);
		
		if(c==null)
		{
			return "redirect:/login";
		}
		s1.setAttribute("email", c.getEmail());
		redirectAttributes.addFlashAttribute("signinSuccess", true);
		return "redirect:/dash";
		
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession s1) {
		s1.invalidate();
		return "redirect:/login";
	}
	
	
	@RequestMapping("/dash")
	public String dash(ModelMap m, HttpSession s1)
	{
		String email = (String)s1.getAttribute("email");
//		if(email != null) {
			List<Packages> allPackages = adService.getPackages();
			m.addAttribute("data", allPackages);
			return "CustDashboard";
//		}else return "redirect:/login";
	}
	
	@GetMapping("/PackDetails/{id}")
	public String packdetails(@PathVariable int id, ModelMap m, HttpSession s1) {
		Packages p = adService.getSinglePackage(id);
		m.addAttribute("packageData", p);
		
		String email = (String) s1.getAttribute("email");
		Customer userData = cc.getUserbyEmail(email);
		m.addAttribute("userData", userData);
		return "CustPackDetails";
	}
	
	
	
//	Admin Mappings
	@RequestMapping("/adminLog")
	public String adLogin() {
		return "AdminLogin";
	}
	
	@RequestMapping("/adminreg")
	public String adminReg() {
		return "AdminReg";
	}
	
	
	
	//Admin Registration method	
	
	@RequestMapping(value="/adminSave", method = RequestMethod.POST)
	public String save(@ModelAttribute("reg") Admin reg) {
		adService.registerAdmin(reg);
		
		return "redirect:/adminLog";
	}
	
	//admin login
	
	@RequestMapping(value="/adminCred", method=RequestMethod.POST)
	public String checkCred(@RequestParam("email") String email, @RequestParam("password") String password, HttpSession z) {
		Admin ad = adService.checkCreds(email, password);
		
		if(ad == null) {
			return "redirect:/adminLog";
		}
		z.setAttribute("admin_email", ad.getEmail());
		return "redirect:/adminHome";
	}
	
	@RequestMapping("/logout_admin")
	public String logout_admin(HttpSession z) {
		z.invalidate();
		return "redirect:/adminLog";
	}
	
	@RequestMapping("/adminHome")
	public String adminhome(HttpSession z, ModelMap m) {
		String admin_email = (String)z.getAttribute("admin_email");
		if(admin_email != null) {
			
			long users = adService.countOfUsers();
			long packs = adService.countOfPackages();
			long bookings = adService.countOfBookings();
			
			m.addAttribute("users", users);
			m.addAttribute("packs", packs);
			m.addAttribute("bookings", bookings);
			
			return "AdminHome";
		}else return "redirect:/adminLog";
	}
	
	@RequestMapping("/add_hotel")
	public String add_hotel(HttpSession z) {
		String admin_email = (String)z.getAttribute("admin_email");
		if(admin_email != null) {
			return "add_hotel";
		}else return "redirect:/adminLog";
	}
	
	@RequestMapping("/create_package")
	public String c_package(ModelMap m, HttpSession z) {
		String admin_email = (String)z.getAttribute("admin_email");
		if(admin_email != null) {
			List<Hotel> allHotels = adService.getHotels();
			m.addAttribute("options", allHotels);
			
			return "create_package";
		}else return "redirect:/adminLog";
	}
	

	@PostMapping("/add_package")
	public String add_packcage(@ModelAttribute ("pack") Packages pack, @RequestParam("thumbnail2") MultipartFile file, @RequestParam("other_images") MultipartFile other_images, HttpSession z, RedirectAttributes redirectAttributes) throws IOException {
		String admin_email = (String)z.getAttribute("admin_email");
		
		if(admin_email != null) {
			String filename = StringUtils.cleanPath(file.getOriginalFilename());
			pack.setThumbnail(filename);
			
			//other image
			String image = StringUtils.cleanPath(other_images.getOriginalFilename());
			pack.setOther_image(image);
			
			Packages saved = adService.storePackage(pack);	
			
			String uploadDirThumb = "src/main/resources/static/thumbnail/"+saved.getId();
			FileUploadUtil.saveFile(uploadDirThumb, filename, file);
			
			String uploadDirImage = "src/main/resources/static/other_images/"+saved.getId();
			FileUploadUtil.saveFile(uploadDirImage, image, other_images);
			
			redirectAttributes.addFlashAttribute("packageAttrribute", true);
			return "redirect:/adminHome";
		}else return "redirect:/adminLog";

	}
	
	
	@RequestMapping("/displayPackage")
	public String displayPackage(ModelMap m, HttpSession z) {
		String admin_email = (String)z.getAttribute("admin_email");
		
		if(admin_email != null) {
			List<Packages> allPackages = adService.getPackages();
			m.addAttribute("data", allPackages);
			return "AdminDisplayPackages";
		}else return "redirect:/adminLog";
	}
	
	@RequestMapping("/displayUsers")
	public String displayUsers(ModelMap m, HttpSession z) {
		String admin_email = (String)z.getAttribute("admin_email");
		
		if(admin_email != null) {
			List<Customer> users = cc.getUsers();
			m.addAttribute("userData", users);
			return "AdminDisplayUsers";
		}else return "redirect:/adminLog";
	}
	
	@GetMapping("/delPackage/{id}")
	public String delPackage(@PathVariable int id, HttpSession z) {
		String admin_email = (String)z.getAttribute("admin_email");
		if(admin_email != null) {
			adService.deletePackages(id);
			return "redirect:/displayPackage";
		}else return "redirect:/adminLog";
	}
	
	@GetMapping("/editPackage/{id}")
	public String editPackage(@PathVariable int id, ModelMap m, HttpSession z) {
		String admin_email = (String)z.getAttribute("admin_email");
		
		if(admin_email != null) {
			Packages singleData = adService.getSinglePackage(id);
			m.addAttribute("data", singleData);
			List<Hotel> allHotels = adService.getHotels();
			m.addAttribute("options", allHotels);
			return "AdminEditPackages";
		}else return "redirect:/adminLog";
	}
	
	@PostMapping("/updatePackage")
	public String updatePackage(@ModelAttribute("data") Packages data, @RequestParam("thumbnail2") MultipartFile file,  @RequestParam("other_images") MultipartFile other_images, HttpSession z) throws IOException {
		String admin_email = (String)z.getAttribute("admin_email");
		
		if(admin_email != null) {
			Packages p = new Packages();
			p.setId(data.getId());
			p.setPack_name(data.getPack_name());
			p.setFrom_destination(data.getFrom_destination());
			p.setPlace(data.getPlace());
			p.setActivities(data.getActivities());
			p.setHotel(data.getHotel());
			p.setNights(data.getNights());
			p.setDescription(data.getDescription());
			p.setPrice(data.getPrice());
		
			
			String Thumbfilename = null;
			String Otherfilename = null;
			
			// delete old thumnail
			if(!file.isEmpty()) {
				String pathtoDeleteThum = "src/main/resources/static/thumbnail/"+data.getId()+"/"+data.getThumbnail();
	
				  try {
			            Files.deleteIfExists(Paths.get(pathtoDeleteThum));
			        } catch (IOException e) {
			            System.out.println("Error deleting file: " + e.getMessage());
			        }
				  
				Thumbfilename = StringUtils.cleanPath(file.getOriginalFilename());
				p.setThumbnail(Thumbfilename);
			}else p.setThumbnail(data.getThumbnail());
			
			// delete old other image
			
			if(!other_images.isEmpty()) {
				String pathtoDeleteOther = "src/main/resources/static/other_images/"+data.getId()+"/"+data.getOther_image();
	
				  try {
			            Files.deleteIfExists(Paths.get(pathtoDeleteOther));
			        } catch (IOException e) {
			            System.out.println("Error deleting file: " + e.getMessage());
			        }
				  
				Otherfilename = StringUtils.cleanPath(other_images.getOriginalFilename());
				p.setOther_image(Otherfilename);
				
			}else p.setOther_image(data.getOther_image());
			
			
			Packages saved = adService.storePackage(p);
			
			//thumb save
			if(!file.isEmpty()) {
				String Dir = "src/main/resources/static/thumbnail/"+saved.getId();
				FileUploadUtil.saveFile(Dir, Thumbfilename, file);
			}
			
			//other image save
			
			if(!other_images.isEmpty()) {
				String uploadDir = "src/main/resources/static/other_images/"+saved.getId();
				FileUploadUtil.saveFile(uploadDir, Otherfilename, other_images);
			}
			
			return "redirect:/displayPackage";
		}else return "redirect:/adminLog";
	}
	
	
	@GetMapping("/delUser/{id}")
	public String delUser(@PathVariable int id, HttpSession z) {
		String admin_email = (String)z.getAttribute("admin_email");
		if(admin_email != null) {
			cc.deleteUser(id);
			return "redirect:/displayUsers";
		}else return "redirect:/adminLog";
	}
	
	@GetMapping("/editUser/{id}")
	public String editUser(@PathVariable int id, ModelMap m, HttpSession z) {
		String admin_email = (String)z.getAttribute("admin_email");
		
		if(admin_email != null) {
			Customer singleData = cc.getSingleCust(id);
			m.addAttribute("data", singleData);
			return "AdminEditUser";
		}else return "redirect:/adminLog";
	}
	
	@GetMapping("/updateUser")
	public String updateUser(@ModelAttribute("user") Customer user, HttpSession z) {
		String admin_email = (String)z.getAttribute("admin_email");
		
		if(admin_email != null) {
			Customer cust = new Customer();
			cust.setId(user.getId());
			cust.setEmail(user.getEmail());
			cust.setGender(user.getGender());
			cust.setName(user.getName());
			cust.setPass(user.getPass());
			cust.setPhone(user.getPhone());
			
			cc.register(cust);
			return "redirect:/displayUsers";
		}else return "redirect:/adminLog";
	}
	
//	Hotel mappings
	
	@PostMapping("/saveHotel")
	public String savehotel(@ModelAttribute("hotel") Hotel hotel, HttpSession z, RedirectAttributes redirectAttributes) {
		String admin_email = (String)z.getAttribute("admin_email");
		
		if(admin_email != null) {
			adService.addHotel(hotel);
			redirectAttributes.addFlashAttribute("hotelAttrribute", true);
			return "redirect:/adminHome";
			
		}else return "redirect:/adminLog";
	}
	
	@RequestMapping("/displayHotels")
	public String showHotels(ModelMap m, HttpSession z) {
		String admin_email = (String)z.getAttribute("admin_email");
		
		if(admin_email != null) {
			List<Hotel> allHotels = adService.getHotels();
			m.addAttribute("data", allHotels);
			return "AdminDisplayHotels";
		}else return "redirect:/adminLog";
	}
	
	@GetMapping("/delHotel/{id}")
	public String delHotel(@PathVariable("id") int id, HttpSession z) {
		String admin_email = (String)z.getAttribute("admin_email");
		if(admin_email != null) {
			adService.deleteHotel(id);
			return "redirect:/displayHotels";
		}else return "redirect:/adminLog";
	}
	
	@GetMapping("/editHotel/{id}")
	public String edithotel(@PathVariable("id") int id, ModelMap m, HttpSession z) {
		String admin_email = (String)z.getAttribute("admin_email");
		if(admin_email != null) {
			Hotel hotel = adService.getSingleHotel(id);
			
			List<Integer> options = Arrays.asList(2, 3, 4, 5, 6, 7);
			m.addAttribute("options", options);
			m.addAttribute("data", hotel);
			return "AdminEditHotel";
		}else return "redirect:/adminLog";
	}
	
	@GetMapping("/updateHotel")
	public String updatehotel(@ModelAttribute("hotel") Hotel hotel, HttpSession z) {
		String admin_email = (String)z.getAttribute("admin_email");
		if(admin_email != null) {
			Hotel h = new Hotel();
			h.setId(hotel.getId());
			h.setAddress(hotel.getAddress());
			h.setName(hotel.getName());
			h.setPrice(hotel.getPrice());
			h.setRating(hotel.getRating());
			
			adService.addHotel(h);
			
			return "redirect:/displayHotels";
		}else return "redirect:/adminLog";
	}
	
	
	@RequestMapping("/allbookings")
	public String displayBookings(HttpSession z, ModelMap m) {
		String admin_email = (String)z.getAttribute("admin_email");
		
		if(admin_email != null) {
			List<Booking> allBookings = adService.getBookings();
			m.addAttribute("bookings", allBookings);
			
			return "AdminDisplayBookings";
		}else return "redirect:/adminLog";
	}
	
	
	//package booking
	
	@GetMapping("/book/{qid}")
	public String book(@PathVariable int qid, @ModelAttribute("booking") Booking b, HttpSession s1) {
		
		String e = (String)s1.getAttribute("email");
		if(e != null) {
			Packages pkg = adService.getSinglePackage(qid);
			
			String email = (String) s1.getAttribute("email");
			Customer user = cc.getUserbyEmail(email);
			b.setPkg_name(pkg.getPack_name());
			b.setCust(user);
			List<Booking> q = user.getBookings();
			
			
			q.add(b);
			cc.book(b);
			user.setBookings(q);
			cc.register(user);
			
			return "redirect:/dash";
		}else return "redirect:/login";
		
		
	}
	
	
	@RequestMapping("/userBookings")  //show user's bookings
	public String allBookings(HttpSession s1, ModelMap m) {
		
		String email = (String)s1.getAttribute("email");
		if(email != null) {
			Customer user = cc.getUserbyEmail(email);
			
			List<Booking> b = cc.getBooking(user.getId());
			m.addAttribute("bookings", b);
			return "Custbookings";
		}else return "redirect:/login";
		
		
	}
	
	
	@GetMapping("/cancelBooking/{uid}")
	public String cancelBooking(@PathVariable int uid, HttpSession s1) {
		String email = (String) s1.getAttribute("email");
		if(email != null) {
			Customer user = cc.getUserbyEmail(email);
			Booking b = cc.getSingleBooking(uid);
			user.getBookings().remove(b);
			cc.cancelbook(uid);
			return "redirect:/userBookings";
		}else return "redirect:/login";
	}
	
	
	@GetMapping("AdmincancelBooking/{bid}/{uid}")
	public String cancel(@PathVariable int bid, @PathVariable int uid ,HttpSession z) {
		String admin_email = (String)z.getAttribute("admin_email");
		if(admin_email != null) {
			Customer user = cc.getSingleCust(uid);
			Booking b = cc.getSingleBooking(bid);
			user.getBookings().remove(b);
			cc.cancelbook(bid);
			return "redirect:/allbookings";
		}else return "redirect:/adminLog";
	}
	
	
	@RequestMapping("/findPackage")
	public String findPackage() {
		return "CustFindpackages";
	}
	
	@PostMapping("/findPacks")
	public String getPack(@RequestParam("from") String from, @RequestParam("to") String to, ModelMap m, HttpSession s1) {
		String email = (String) s1.getAttribute("email");
		if(email != null) {
			List<Packages> p = adService.findPackages(from, to);
			m.addAttribute("data", p);
			return "CustFindpackages";
		}else return "redirect:/login";
	}
	
}






