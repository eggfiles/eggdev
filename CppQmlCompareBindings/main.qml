import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.5


Window {
    id: root
    visible: true
    width: 700
    height: 400
    title: qsTr("Comparing cpp-qml-bindings")

    property int            mainDistance : _controller.m_distance
    readonly property int   safetyDistance : _controller.mSAFETYDISTANCE

    Label{
        y: 10
        font.pixelSize: 16
        text: "Object starts with distance of 10 m to back side and shall stop at 5 m safety distance."
    }


    Label{
        id: lblStatus

        x: 255
        y: 60
        background:
            Rectangle {
                width: 100
                border.color: "black"
        }
        height: 40
        width: 60
        verticalAlignment: Qt.AlignVCenter
        horizontalAlignment: Qt.AlignHCenter
        color: (root.mainDistance >= root.safetyDistance) ? "green" : "red"
        text: (root.mainDistance >= root.safetyDistance) ? root.mainDistance : "Alert"
    }


    View_JS{
        y: 120
        onDistanceChangedInJs: {    //JavaScript assignments rule just once and break other bindings
            mainDistance = distance;

            lblStatus.text = (root.mainDistance >= root.safetyDistance) ? root.mainDistance : "Alert";

            lblStatus.color = (root.mainDistance >= root.safetyDistance) ? "green" : "red";
        }
    }


    View_SignalReturn{
        y: 180
    }


    View_Bind{
        y: 240
    }

}
