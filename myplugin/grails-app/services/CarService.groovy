import commandObjects.CarPicUpload
import grails.transaction.Transactional
import myplugin.Car
import org.springframework.web.multipart.MultipartFile

class CarService {
    def fileService

    def carPictureUpload(MultipartFile carPic, Car car) {
        if (!carPic.isEmpty()) {
            def storagePath = fileService.getCarPicturePath(car)
            def storagePathDirectory = new File(storagePath as String)
            if (!storagePathDirectory.exists()) {
                if (storagePathDirectory.mkdirs()) {
                    println "SUCCESS"
                } else {
                    println "FAILED"
                }
            }
            if (!carPic.isEmpty()) {
                String uuid = UUID.randomUUID().toString()
                carPic.transferTo(new File("${storagePath}/${uuid}"))
                println "=============original image==============" + carPic
                car.carPicture = uuid
                car.carPictureContentType = carPic.contentType
            } else {
                println "File ${carPic} is Empty"
                car.carPicture = null
            }
            car.save(flush: true)
        }
    }

    def delete(Map params) {
        Car car = Car.findByUuid(params.id)
        if (car) {
            car.delete(flush: true)
        }
    }

    def check() {
    }


}
