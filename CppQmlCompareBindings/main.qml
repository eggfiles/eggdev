import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.5

Window {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Comparing bindings")

    property int            mainDistance : _controller.m_distance
    readonly property int   safetyDistance : _controller.mSAFETYDISTANCE

    Label{
        y: 10
        font.pixelSize: 16
        text: "Object starts with distance of 10 m to back side and shall stop at 5 m safety distance."
    }



    View_Bind{
        y: 60
    }



    Label{
        id: lblStatus

        x: 300
        y: 110

        height: 40
        width: 60
        verticalAlignment: Qt.AlignVCenter
        horizontalAlignment: Qt.AlignHCenter
        color: (root.mainDistance >= root.safetyDistance) ? "green" : "red"
        text: (root.mainDistance >= root.safetyDistance) ? root.mainDistance : "Alert"
    }



    View_JS{
            y: 160
            onDistanceChangedInJs: {
                mainDistance = distance;

                if(root.mainDistance >= root.safetyDistance)
                    lblStatus.text = mainDistance;
                else
                    lblStatus.text = "Alert";


                if(root.mainDistance >= root.safetyDistance)
                    lblStatus.color = "green";
                else
                    lblStatus.color = "red";
            }
        }
}
