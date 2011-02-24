# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
EGIT_COMMIT="99cdb9c"
EGIT_REPO_URI="git://github.com/mono/gio-sharp.git"
inherit git eutils mono autotools

DESCRIPTION="A branch of the official gtk-sharp/gio to get gio-sharp building on gtk-sharp 2.12"
HOMEPAGE="http://github.com/mono/gio-sharp"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND=">=dev-lang/mono-2
        dev-dotnet/glib-sharp
        dev-dotnet/gtk-sharp-gapi
        >=dev-libs/glib-2.22:2"
DEPEND="${RDEPEND}"

src_prepare () {
        cd "${WORKDIR}/${PN}/"
        ./autogen-2.22.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var
}

src_configure () {
        econf || die "configure failed"
}

src_compile() {
        emake -j1 || die "make failed"
}

src_install() {
        emake DESTDIR="${D}" install || die "install failed"
}