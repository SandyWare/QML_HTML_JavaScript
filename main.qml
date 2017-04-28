import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtWebEngine 1.4


ApplicationWindow {
    id: mainWindow
    width: 1024
    height: 550
    visible: true
    title: qsTr("Render Web Pages")

    WebEngineView {
        id: webEngine
        anchors.fill: parent
        url: "qrc:/Page1.html"
        settings.javascriptCanAccessClipboard: true
        settings.javascriptCanOpenWindows : true
        settings.javascriptEnabled: true
        settings.pluginsEnabled: true
        settings.autoLoadImages: true

        onLoadingChanged: {
            switch(loadRequest.status){
            case  WebEngineLoadRequest.LoadStartedStatus:
                console.log("LoadStartedStatus");
                webEngine.runJavaScript("document.OnClick", function(result) { console.log("SW->Script Runs"); });
                break;
            }

        }
    }
}
