# gitbook-pd

gitbook Docker image for Japanese environment.


```sh
git clone https://github.com/HWataru/gitbook-pdf.git

cd gitbook-pdf

# install dependencies
docker run --rm -v $(pwd)/sample:/book hwataru/gitbook-pdf gitbook install

# build pdf
docker run --rm -v $(pwd)/sample:/book hwataru/gitbook-pdf gitbook pdf

# build epub
docker run --rm -v $(pwd)/sample:/book hwataru/gitbook-pdf gitbook epub

# serve web page
docker run --rm -v $(pwd)/sample:/book -p 4000:4000 hwataru/gitbook-pdf gitbook serve
```

## Installed Fonts

- [IPA Font](https://packages.debian.org/sid/fonts/fonts-ipafont)
- [IPAEX Font](https://packages.debian.org/sid/fonts/fonts-ipaexfont)

IPA font lisense <https://ipafont.ipa.go.jp/ipa_font_license_v1-html#jp>

- [Noto Font](https://packages.debian.org/sid/main/fonts-noto): [SIL Open Font License (OFL)](https://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=OFL)
