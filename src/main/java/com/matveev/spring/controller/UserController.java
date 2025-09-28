package com.matveev.spring.controller;

import com.matveev.spring.entity.User;
import com.matveev.spring.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
@RequestMapping("/users")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    // показать всех пользователей
    @GetMapping
    public String list(Model model) {
        model.addAttribute("users", userService.getAll());
        return "users/list"; // /WEB-INF/views/users/list.jsp
    }

    // форма добавления / редактирования
    @GetMapping("/form")
    public String form(@RequestParam(value = "id", required = false) Long id, Model model) {
        model.addAttribute("user", id == null ? new User() : userService.get(id));
        return "users/form"; // /WEB-INF/views/users/form.jsp
    }

    @PostMapping("/save")
    public String save(@Valid @ModelAttribute("user") User user,
                       BindingResult bindingResult,
                       RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            return "users/form";
        }
        userService.save(user);
        redirectAttributes.addFlashAttribute("message", "Пользователь успешно сохранён ✅");
        return "redirect:/users";
    }

    @PostMapping("/delete")
    public String delete(@RequestParam Long id, RedirectAttributes redirectAttributes) {
        userService.delete(id);
        redirectAttributes.addFlashAttribute("message", "Пользователь удалён 🗑");
        return "redirect:/users";
    }
}
