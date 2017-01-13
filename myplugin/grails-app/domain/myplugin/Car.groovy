package myplugin

class Car {

    String name
    Long amount
    String uuid = UUID.randomUUID().toString()

    String carPicture
    String carPictureContentType

    Date dateCreated
    Date lastUpdated

    static constraints = {
        amount(nullable: true, blank: true)
        carPicture(nullable: true, blank: true)
        carPictureContentType(nullable: true, blank: true)
    }
}
