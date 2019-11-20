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
            font: {font.bold = true; font.pixelSize = 13}
            text: "Binding with JavaScript assignments"
        }


        Button{
            id: btnBackwardJs

            text: "Backward"
            focus: true
            onClicked: {     //JavaScript assignments rule just once and break other bindings
                root.distance = root.distance - 1;
                if(root.distance < root.safetyDistance)
                    btnBackwardJs.enabled = false;
                distanceChangedInJs(root.distance);
            }
        }

        Label{
            id: lblConclusion

            height: 40
            width: 250
            verticalAlignment: Qt.AlignVCenter
            font: {font.bold = false; font.pixelSize = 13}
            text: "- singular assignments break real bindings\n- expensive, bloated code\n- no logical control in cpp"
        }
    }
}

