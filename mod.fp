mod "ipstack" {
  title         = "Ipstack"
  description   = "Run pipelines to supercharge your Ipstack workflows using Flowpipe."
  color         = "#FF9900"
  documentation = file("./README.md")
  icon          = "/images/mods/turbot/ipstack.svg"
  categories    = ["library", "networking"]

  opengraph {
    title       = "Ipstack Mod for Flowpipe"
    description = "Run pipelines to supercharge your Ipstack workflows using Flowpipe."
    image       = "/images/mods/turbot/ipstack-social-graphic.png"
  }

  require {
    flowpipe {
      min_version = "1.0.0"
    }
  }
}
