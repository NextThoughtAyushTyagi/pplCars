package myplugin

import grails.transaction.Transactional

class MyDemoService {

    def serviceMethod() {

    }

    def repoverdue() {
        Car car = new Car(name: "kestel", company: "Toyota", seater: 8, type: "diesel")
        Car car1 = new Car(name: "Wagon-R", company: "Maruti", seater: 4, type: "petrol")
        Car car2 = new Car(name: "Duster", company: "Renault", seater: 8, type: "diesel")
        car.save(flush: true)
        car1.save(flush: true)
        car2.save(flush: true)

        return "Car => ${car.name}, Car1 = > ${car1.name},  Car2 = > ${car2.name}"
    }
}
