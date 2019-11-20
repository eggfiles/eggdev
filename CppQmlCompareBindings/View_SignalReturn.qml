import QtQuick 2.0
import QtQuick.Controls 2.5

Item {

    id: root

    readonly property int    safetyDistance: _controller.mSAFETYDISTANCE     //as static not usable here
    property int             distance: _controller.m_distance



    /////       SIGNAL-RETURN     /////
    Row{
        spacing: 5

        Label{
            id: lblBinding

            height: 40
            width: 250
            verticalAlignment: Qt.AlignVCenter
            font: {font.bold = true; font.pixelSize = 13}
            text: "Binding with signal/return signal"
        }


        Button{
            id: btnBackward

            text: "Backward"
            focus: true
            enabled: (_controller.m_distance >= _controller.mSAFETYDISTANCE) ? true : false
            onClicked: {                            //triggering change signal that emits back app-wide
                _controller.setDistance(root.distance - 1);
            }
        }

        Label{
            id: lblConclusion

            height: 40
            width: 250
            verticalAlignment: Qt.AlignVCenter
            font: {font.bold = false; font.pixelSize = 13}
            text: "+ economical short code\n+ real binding to cpp controller\n+ controller returns signal of verified value"
        }
    }
}
