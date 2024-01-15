package com.example.demo;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

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

import com.mysql.cj.jdbc.Blob;

@Controller
public class CustomerController 
{
	@Autowired
	CustomerService cc;
	
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
	public String check(@RequestParam("email") String email,@RequestParam("pass") String pass)
	{
		Customer c=cc.checkcred(email,pass);
		
		if(c==null)
		{
			return "redirect:/login";
		}
		return "redirect:/dash";
		
	}
	
	
	@RequestMapping("/dash")
	public String dash(ModelMap m)
	{
		List<Packages> allPackages = adService.getPackages();
		m.addAttribute("data", allPackages);
		return "CustDashboard";
	}
	
	@RequestMapping("/adminLog")
	public String adLogin() {
		return "AdminLogin";
	}
	
	@RequestMapping("/adminreg")
	public String adminReg() {
		return "AdminReg";
	}
	
	@Autowired
	AdminService adService;
	
	//Admin Registration method	
	
	@RequestMapping(value="/adminSave", method = RequestMethod.POST)
	public String save(@ModelAttribute("reg") Admin reg) {
		adService.registerAdmin(reg);
		
		return "redirect:/adminLog";
	}
	
	//admin login
	
	@RequestMapping(value="/adminCred", method=RequestMethod.POST)
	public String checkCred(@RequestParam("email") String email, @RequestParam("password") String password) {
		Admin ad = adService.checkCreds(email, password);
		
		if(ad == null) {
			return "redirect:/adminLog";
		}
		return "redirect:/adminHome";
	}
	
	
	@RequestMapping("/adminHome")
	public String adminhome() {
		return "AdminHome";
	}
	
	@RequestMapping("/add_hotel")
	public String add_hotel() {
		return "add_hotel";
	}
	
	@RequestMapping("/create_package")
	public String c_package() {
		return "create_package";
	}
	

	@PostMapping("/add_package")
	public String add_packcage(@ModelAttribute ("pack") Packages pack, @RequestParam("thumbnail2") MultipartFile file, @RequestParam("other_images") MultipartFile other_images) throws IOException {
		
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
		return "redirect:/adminHome";

	}
	
	
	@RequestMapping("/displayPackage")
	public String displayPackage(ModelMap m) {
		
		List<Packages> allPackages = adService.getPackages();
		m.addAttribute("data", allPackages);
		return "AdminDisplayPackages";
	}
	
	@RequestMapping("/displayUsers")
	public String displayUsers(ModelMap m) {
		List<Customer> users = cc.getUsers();
		m.addAttribute("userData", users);
		return "AdminDisplayUsers";
	}
	
	@GetMapping("/delPackage/{id}")
	public String delPackage(@PathVariable int id) {
		adService.deletePackages(id);
		return "redirect:/displayPackage";
	}
	
	@GetMapping("/editPackage/{id}")
	public String editPackage(@PathVariable int id, ModelMap m) {
		Packages singleData = adService.getSinglePackage(id);
		m.addAttribute("data", singleData);
		return "AdminEditPackages";
	}
	
	@PostMapping("/updatePackage")
	public String updatePackage(@ModelAttribute("data") Packages data, @RequestParam("thumbnail2") MultipartFile file,  @RequestParam("other_images") MultipartFile other_images) throws IOException {
			
		Packages p = new Packages();
		p.setId(data.getId());
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
	}
	
	
	@GetMapping("/delUser/{id}")
	public String delUser(@PathVariable int id) {
		cc.deleteUser(id);
		return "redirect:/displayUsers";
	}
	
	@GetMapping("/editUser/{id}")
	public String editUser(@PathVariable int id, ModelMap m) {
		Customer singleData = cc.getSingleCust(id);
		m.addAttribute("data", singleData);
		return "AdminEditUser";
	}
	
	@GetMapping("/updateUser")
	public String updateUser(@ModelAttribute("user") Customer user) {
		Customer cust = new Customer();
		cust.setId(user.getId());
		cust.setEmail(user.getEmail());
		cust.setGender(user.getGender());
		cust.setName(user.getName());
		cust.setPass(user.getPass());
		cust.setPhone(user.getPhone());
		
		cc.register(cust);
		return "redirect:/displayUsers";
	}
	
}






