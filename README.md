# Carnegie Museum of Art
## Universal iOS Application

This mobile application syncs with [CMOA's CMS](https://github.com/cmoa/cmoa-app-cms) and gets all exhibition data (artists, artworks, related media, tours, etc.)

Current iOS target: **6.1**

### Installation guide:

#### Configuration

Copy/rename **settings.example.plist** to **settings.plist** in **/International** directory. Edit the following settings in the file:

* **testflight\_id**: Include a TestFlight app id if TestFlight functionality is required. Otherwise, delete this key.
* **api\_token**/**api\_secret**: Copy the same API token & secret hashes from the CMS configuration for security.