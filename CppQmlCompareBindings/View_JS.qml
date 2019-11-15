import QtQuick 2.0
import QtQuick.Controls 2.5

Item {

    id: root

    readonly property int   safetyDistance: _controller.mSAFETYDISTANCE      //as static not usable here
    property int            distance: _controller.m_distance

    signal                  distanceChangedInJs(int distance);


    /////       JAVASCRIPT-ASSIGNMENTS - NOT RECOMMENDED    /////
    Row{
        spacing: 5

        Label{
            id: lblJs

            height: 40
            width: 250
            verticalAlignment: Qt.AlignVCenter
            font.bold: true
            text: "Binding with JavaScript assignments"
        }


        Button{
            id: btnBackwardJs

            text: "Backward"
            focus: true
            onClicked: {
                root.distance = root.distance - 1;
                if(root.distance < root.safetyDistance)
                    btnBackwardJs.enabled = false;
                distanceChangedInJs(root.distance);
            }
        }
    }
}

