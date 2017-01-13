package plugin

databaseChangeLog = {

    changeSet(author: "ayush (generated)", id: "1484209445665-1") {
        createTable(tableName: "car") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "carPK")
            }

            column(name: "version", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "company", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }

            column(name: "name", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }

            column(name: "seater", type: "BIGINT")

            column(name: "type", type: "VARCHAR(255)")
        }
    }
}