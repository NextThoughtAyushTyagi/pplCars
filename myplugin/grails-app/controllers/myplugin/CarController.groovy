package myplugin

import commandObjects.CarPicUpload
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.MultipartFile

@Secured(value = ['permitAll'])
class CarController {
    def carService
    def borrowerService

    def index() {
        List<Car> carList = Car.list()
        render view: 'index', model: [cars: carList]
    }

    def createUpdateCar(CarPicUpload carPicUpload) {
        String amount = params?.amount?.replace(',', '')
        if (params.url.equals("updateCar")) {
            Car car = Car.findByUuid(params.uuid)
            if (car) {
                Car exists = Car.findByName(params.name)
                if (!exists) {
                    car.name = params.name
                    car.amount = amount as Long
                    car.save(flush: true)
                    flash.message = "Car details updated successfully ! "
                    if (carPicUpload.validate()) {
                        carService.carPictureUpload(carPicUpload?.carPic, car)
                    } else {
                        flash.error = "Image format is not supported"
                    }
                } else {
                    flash.error = "Car already exists with name '${params.name}' ! "
                }
            }
        } else if (params.url.equals("createCar")) {
            Car exists = Car.findByName(params.name)
            if (!exists) {
                Car car = new Car()
                car.name = params.name
                car.amount = amount as Long
                car.save(flush: true)
                flash.message = "Car details updated successfully ! "
                if (carPicUpload.validate()) {
                    carService.carPictureUpload(carPicUpload?.carPic, car)
                } else {
                    flash.error = "Image format is not supported"
                }
            } else {
                flash.error = "'${params.name}' Car already exists ! "
            }
        }
        redirect(action: 'index')
    }

    def deleteCar() {
        carService.delete(params)
        redirect(action: 'index')
    }

}
