import TopShot from 0x01

transaction {
    let admin: auth(Admin) &TopShot.Admin

    prepare(acct: auth(Storage) &Account) {
        // Borrow the Admin resource from the specified storage path
        self.admin = acct.storage.borrow<&TopShot.Admin>(from: /storage/TopShotAdmin)
            ?? panic("Cannot borrow admin resource")
    }

    execute {
        // Create plays using the admin resource
        self.admin.createPlay(metadata: {"Rookie": "2004", "Player Name": "Dwight Howard"})
        self.admin.createPlay(metadata: {"Rookie": "2003", "Player Name": "Dwayne Wade"})
        log("Play created")
    }
}
