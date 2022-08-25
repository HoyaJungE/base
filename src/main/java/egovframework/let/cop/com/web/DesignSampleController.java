package egovframework.let.cop.com.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.Map;

@Controller
public class DesignSampleController {
    @RequestMapping(value = "/cop/com/SelectDesignSample.do")
    public String SelectDesignSample(@RequestParam Map<String, Object> commandMap, ModelMap model) throws Exception {

        return "cop/com/DesignSample";
    }
}