import "TopShot"

access(all) contract Recipe {
    // This is a snippet extracting the relevant logic from the TopShot contract for demonstration purposes
    // TopShot Contract Code Above

    access(all) var playDatas: {UInt32: Play}

    access(all) var nextPlayID: UInt32

    // Play is a Struct that holds metadata associated 
    // with a specific NBA play, like the legendary moment when 
    // Ray Allen hit the 3 to tie the Heat and Spurs in the 2013 finals game 6
    // or when Lance Stephenson blew in the ear of Lebron James.
    //
    // Moment NFTs will all reference a single play as the owner of
    // its metadata. The plays are publicly accessible, so anyone can
    // read the metadata associated with a specific play ID
    //
    access(all) struct Play {
        // The unique ID for the Play
        access(all) let playID: UInt32

        // Stores all the metadata about the play as a string mapping
        // This is not the long-term way NFT metadata will be stored.
        access(all) let metadata: {String: String}

        init(metadata: {String: String}) {
            pre {
                metadata.length != 0: "New Play metadata cannot be empty"
            }
            self.playID = TopShot.nextPlayID
            self.metadata = metadata
        }
    }



    access(all)
    resource Admin {

        // createPlay creates a new Play struct 
        // and stores it in the Plays dictionary in the TopShot smart contract
        //
        // Parameters: metadata: A dictionary mapping metadata titles to their data
        // Returns: the ID of the new Play object
        access(all)
        fun createPlay(metadata: {String: String}): UInt32 {
            // Create the new Play
            let newPlay = Play(metadata: metadata)
            let newID = newPlay.playID

            // Increment the ID so that it isn't used again
            TopShot.nextPlayID = TopShot.nextPlayID + UInt32(1)

            emit PlayCreated(id: newPlay.playID, metadata: metadata)

            // Store it in the contract storage
            TopShot.playDatas[newID] = newPlay

            return newID
        }
    }

    // Rest of TopShot contract below

}