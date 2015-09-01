# Copyright (c) 2015 Oliver Lau <ola@ct.de>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

TARGET = ctSESAM

TEMPLATE = app qt

QT += core gui widgets concurrent network

TRANSLATIONS += translations/i18n_de.ts

CONFIG += warn_off

win32 {
    QMAKE_CXXFLAGS += -wd4100
    QMAKE_CXXFLAGS_DEBUG += -sdl
    QMAKE_CXXFLAGS_RELEASE += -GA -GL -Ox
    DEFINES += _SCL_SECURE_NO_WARNINGS CRYPTOPP_DISABLE_ASM CRYPTOPP_MANUALLY_INSTANTIATE_TEMPLATES
    RC_FILE = ctSESAM.rc
    SOURCES += dump.cpp
    HEADERS += dump.h
    LIBS += User32.lib
    QMAKE_LFLAGS_DEBUG += /INCREMENTAL:NO
}

unix {
    QMAKE_CXXFLAGS += -std=c++11
    LIBS += -lcryptopp
}

CONFIG(debug) {
    QT += testlib
    SOURCES +=
    HEADERS +=
}

SOURCES += main.cpp \
    mainwindow.cpp \
    3rdparty/bigint/bigInt.cpp \
    domainsettings.cpp \
    optionsdialog.cpp \
    progressdialog.cpp \
    domainsettingslist.cpp \
    global.cpp \
    newdomainwizard.cpp \
    masterpassworddialog.cpp \
    crypter.cpp \
    securebytearray.cpp \
    servercertificatewidget.cpp \
    util.cpp \
    pbkdf2.cpp \
    password.cpp \
    changemasterpassworddialog.cpp

win32:SOURCES += \
    3rdparty/cryptopp562/sha.cpp \
    3rdparty/cryptopp562/iterhash.cpp \
    3rdparty/cryptopp562/misc.cpp \
    3rdparty/cryptopp562/simple.cpp \
    3rdparty/cryptopp562/cryptlib.cpp \
    3rdparty/cryptopp562/cpu.cpp \
    3rdparty/cryptopp562/filters.cpp \
    3rdparty/cryptopp562/queue.cpp \
    3rdparty/cryptopp562/algparam.cpp \
    3rdparty/cryptopp562/fips140.cpp \
    3rdparty/cryptopp562/mqueue.cpp \
    3rdparty/cryptopp562/rijndael.cpp \
    3rdparty/cryptopp562/ccm.cpp \
    3rdparty/cryptopp562/authenc.cpp \
    3rdparty/cryptopp562/modes.cpp \
    3rdparty/cryptopp562/strciphr.cpp \
    3rdparty/cryptopp562/des.cpp \
    3rdparty/cryptopp562/rdtables.cpp \
    3rdparty/cryptopp562/dessp.cpp \
    3rdparty/cryptopp562/rng.cpp \
    3rdparty/cryptopp562/osrng.cpp

HEADERS  += \
    mainwindow.h \
    3rdparty/bigint/bigInt.h \
    util.h \
    domainsettings.h \
    optionsdialog.h \
    progressdialog.h \
    domainsettingslist.h \
    global.h \
    newdomainwizard.h \
    masterpassworddialog.h \
    hackhelper.h \
    crypter.h \
    securebytearray.h \
    servercertificatewidget.h \
    pbkdf2.h \
    password.h \
    changemasterpassworddialog.h

win32:HEADERS += \
    3rdparty/cryptopp562/sha.h \
    3rdparty/cryptopp562/config.h \
    3rdparty/cryptopp562/cryptlib.h \
    3rdparty/cryptopp562/iterhash.h \
    3rdparty/cryptopp562/misc.h \
    3rdparty/cryptopp562/secblock.h \
    3rdparty/cryptopp562/simple.h \
    3rdparty/cryptopp562/smartptr.h \
    3rdparty/cryptopp562/stdcpp.h \
    3rdparty/cryptopp562/cpu.h \
    3rdparty/cryptopp562/filters.h \
    3rdparty/cryptopp562/queue.h \
    3rdparty/cryptopp562/algparam.h \
    3rdparty/cryptopp562/fips140.h \
    3rdparty/cryptopp562/mqueue.h \
    3rdparty/cryptopp562/aes.h \
    3rdparty/cryptopp562/ccm.h \
    3rdparty/cryptopp562/authenc.h \
    3rdparty/cryptopp562/modes.h \
    3rdparty/cryptopp562/strciphr.h \
    3rdparty/cryptopp562/des.h \
    3rdparty/cryptopp562/rijndael.h \
    3rdparty/cryptopp562/seckey.h \
    3rdparty/cryptopp562/rng.h


FORMS += mainwindow.ui \
    optionsdialog.ui \
    progressdialog.ui \
    newcredentialsdialog.ui \
    newdomainwizard.ui \
    masterpassworddialog.ui \
    servercertificatewidget.ui \
    changemasterpassworddialog.ui

RESOURCES += \
    ctSESAM.qrc

DISTFILES += \
    .gitignore \
    LICENSE \
    ../README.md \
    translations/i18n_de.ts \
    ctSESAM.rc \
    ../deploy/ctSESAM.nsi \
    ../.gitignore \
    Doxyfile \
    deploy/ctSESAM.nsi

OTHER_FILES +=
