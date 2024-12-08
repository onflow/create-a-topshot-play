import "TopShot"

transaction {
    let admin: &TopShot.Admin

    prepare(acct: AuthAccount) {
        // Borrow the Admin resource from the specified storage path
        self.admin = acct.borrow<&TopShot.Admin>(from: /storage/TopShotAdmin)
            ?? panic("Cannot borrow admin resource")
    }

    execute {
        // Create plays using the admin resource
        self.admin.createPlay(metadata: {"Rookie": "2004", "Player Name": "Dwight Howard"})
        self.admin.createPlay(metadata: {"Rookie": "2003", "Player Name": "Dwayne Wade"})
        log("Play created")
    }
}
