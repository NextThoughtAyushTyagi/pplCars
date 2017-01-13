package commandObjects

import grails.validation.Validateable
import org.springframework.web.multipart.MultipartFile

class CarPicUpload implements Validateable {
    MultipartFile carPic

    static constraints = {
        carPic(nullable: false, validator: {val->
            String fileName = val?.getOriginalFilename()
            fileName = fileName?.toLowerCase()
            if(!(fileName.endsWith("jpg") || fileName.endsWith("tif") || fileName.endsWith("png") || fileName.endsWith("gif"))){
                return "profile.pic.incorrect.format"
            }
        })
    }
}
