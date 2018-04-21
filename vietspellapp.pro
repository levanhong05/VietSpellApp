QT += quick qml network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

unix:TARGET = bin/VietSpellApp
win32:TARGET = ../bin/VietSpellApp

TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES +=      main.cpp \
    flowlayout.cpp \
    setting.cpp \
    translation.cpp

RESOURCES +=    qml.qrc \
                vietspell_res.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =
QML2_IMPORT_PATH += $PWD/theme

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# Default rules for deployment.
include(vietspellapp.pri)
include(translation.pri)

TRANSLATIONS = translation/qml_vi.ts

win32:RC_FILE = vietspellapp.rc

DISTFILES += \
                android/AndroidManifest.xml

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

macos:QMAKE_INFO_PLIST = macos/Info.plist
ios:QMAKE_INFO_PLIST = ios/Info.plist

OTHER_FILES +=  images/LICENSE \
                LICENSE \
                *.md

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    flowlayout.h \
    setting.h \
    translation.h \
    version.h
