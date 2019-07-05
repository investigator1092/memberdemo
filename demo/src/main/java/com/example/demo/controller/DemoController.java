package com.example.demo.controller;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Optional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.form.ActorForm;
import com.example.demo.repository.Actor;
import com.example.demo.repository.ActorRepository;
import com.example.demo.repository.Prefecture;
import com.example.demo.repository.PrefectureRepository;

@Controller
public class DemoController {

  @Autowired
  ActorRepository actorRepository;

  @Autowired
  PrefectureRepository prefectureRepository;

  @Autowired
  MessageSource msg;

  @InitBinder
  public void initBinder(WebDataBinder binder) {
    binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
  }

  @GetMapping("/actor")
  public String index(Model model, Locale locale) {
    List<Actor> rows = actorRepository.findAll();
    if (CollectionUtils.isEmpty(rows)) {
      String message = msg.getMessage("actor.rows.empty", null, locale);
      model.addAttribute("emptyMessage", message);
    }
    model.addAttribute("rows", rows);
    return "Actor/index";
  }

  @GetMapping("/actor/{id}")
  public ModelAndView detail(@PathVariable Integer id, ModelAndView mv) {
    // ModelAndView mv = new ModelAndView();
    mv.setViewName("Actor/detail");
    // ここOptionalに変えた
    Optional<Actor> actor = actorRepository.findById(id);
    mv.addObject("actor", actor.orElse(null));
    return mv;
  }
  @GetMapping("/actor/search")
  public ModelAndView search(@RequestParam String keyword, ModelAndView mv, Locale locale) {
    // ModelAndView mv = new ModelAndView();
    mv.setViewName("Actor/index");
    if (StringUtils.isNotEmpty(keyword)) {
      List<Actor> rows = actorRepository.findActors(keyword);
      if (CollectionUtils.isEmpty(rows)) {
        String message = msg.getMessage("actor.rows.empty", null, locale);
        mv.addObject("emptyMessage", message);
      }
      mv.addObject("rows", rows);
    }
    return mv;
  }

  @GetMapping("/actor/create")
  public String create(ActorForm form, Model model) {
    List<Prefecture> pref = prefectureRepository.findAll();
    model.addAttribute("pref", pref);
    return "Actor/create";
  }

  @PostMapping("/actor/save")
  public String save(@Validated @ModelAttribute ActorForm form, BindingResult result, Model model, Locale locale) {
    if (result.hasErrors()) {
      String message = msg.getMessage("actor.validation.error", null, locale);
      model.addAttribute("errorMessage", message);
      return create(form, model);
    }
    Actor actor = convert(form);
    actor = actorRepository.saveAndFlush(actor);
    return "redirect:/actor/" + actor.getId().toString();
  }

  @GetMapping("/actor/delete/{id}")
  public String delete(@PathVariable Integer id, RedirectAttributes attributes, Model model) {
    // ここdeleteから変えた
    actorRepository.deleteById(id);
    attributes.addFlashAttribute("deleteMessage", "delete ID:" + id);
    return "redirect:/actor";
  }

  /**
   * convert form to model.
   */
  private Actor convert(ActorForm form) {
    Actor actor = new Actor();
    actor.setName(form.getName());
    if (StringUtils.isNotEmpty(form.getHeight())) {
      actor.setHeight(Integer.valueOf(form.getHeight()));
    }
    if (StringUtils.isNotEmpty(form.getBlood())) {
      actor.setBlood(form.getBlood());
    }
    if (StringUtils.isNotEmpty(form.getBirthday())) {
      DateTimeFormatter withoutZone = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
      LocalDateTime parsed = LocalDateTime.parse(form.getBirthday() + " 00:00:00", withoutZone);
      Instant instant = parsed.toInstant(ZoneOffset.ofHours(9));
      actor.setBirthday(Date.from(instant));
    }
    if (StringUtils.isNotEmpty(form.getBirthplaceId())) {
      actor.setBirthplaceId(Integer.valueOf(form.getBirthplaceId()));
    }
    actor.setUpdateAt(new Date());
    return actor;
  }

}