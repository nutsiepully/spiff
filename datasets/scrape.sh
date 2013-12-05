
scrape() {
  wget \
    --recursive \
    --no-clobber \
    --page-requisites \
    --convert-links \
    --domains $2 \
    --no-parent \
    $1
}

SET1_URL=http://www.ibiblio.org/wm/paint/auth/
SET1_DOMAIN=ibiblio.org

SET2_URL=http://www.wikipaintings.org/
SET2_DOMAIN=wikipaintings.org

case "$1" in
  "1")
    scrape $SET1_URL $SET1_DOMAIN
    ;;
  "2")
    scrape $SET2_URL $SET2_DOMAIN
    ;;
esac
