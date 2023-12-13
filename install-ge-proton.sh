# Create temporary directory for GE-Proton
mkdir /tmp/proton-ge-custom
cd /tmp/proton-ge-custom

# Download latest GE-Proton tarball
curl -sLOJ "$(curl -s https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/latest | grep browser_download_url | cut -d\" -f4 | grep .tar.gz)"

# Make required directory for GE-Proton installation
mkdir -p /home/deck/.steam/root/compatibilitytools.d/

# Install GE-Proton as Steam compatibility tool
tar -xf GE-Proton*.tar.gz -C /home/deck/.steam/root/compatibilitytools.d/
