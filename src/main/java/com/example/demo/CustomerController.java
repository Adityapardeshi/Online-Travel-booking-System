package com.example.demo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String dash()
	{
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
	public String add_packcage(@ModelAttribute("pack") Packages pack) {
		adService.storePackage(pack);
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
}






