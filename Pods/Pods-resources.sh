#!/bin/sh
set -e

RESOURCES_TO_COPY=${PODS_ROOT}/resources-to-copy-${TARGETNAME}.txt
> "$RESOURCES_TO_COPY"

install_resource()
{
  case $1 in
    *.storyboard)
      echo "ibtool --errors --warnings --notices --output-format human-readable-text --compile ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .storyboard`.storyboardc ${PODS_ROOT}/$1 --sdk ${SDKROOT}"
      ibtool --errors --warnings --notices --output-format human-readable-text --compile "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .storyboard`.storyboardc" "${PODS_ROOT}/$1" --sdk "${SDKROOT}"
      ;;
    *.xib)
        echo "ibtool --errors --warnings --notices --output-format human-readable-text --compile ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .xib`.nib ${PODS_ROOT}/$1 --sdk ${SDKROOT}"
      ibtool --errors --warnings --notices --output-format human-readable-text --compile "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .xib`.nib" "${PODS_ROOT}/$1" --sdk "${SDKROOT}"
      ;;
    *.framework)
      echo "mkdir -p ${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      mkdir -p "${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      echo "cp -fpR ${PODS_ROOT}/$1 ${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      cp -fpR "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      ;;
    *.xcdatamodel)
      echo "xcrun momc \"${PODS_ROOT}/$1\" \"${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1"`.mom\""
      xcrun momc "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcdatamodel`.mom"
      ;;
    *.xcdatamodeld)
      echo "xcrun momc \"${PODS_ROOT}/$1\" \"${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcdatamodeld`.momd\""
      xcrun momc "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcdatamodeld`.momd"
      ;;
    /*)
      echo "$1"
      echo "$1" >> "$RESOURCES_TO_COPY"
      ;;
    *)
      echo "${PODS_ROOT}/$1"
      echo "${PODS_ROOT}/$1" >> "$RESOURCES_TO_COPY"
      ;;
  esac
}
install_resource "AKTabBarController/AKTabBarController/AKTabBarController.bundle"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/button_grey.png"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/button_grey@2x.png"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/button_red.png"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/button_red@2x.png"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/ActionSheet/action-black-button-selected.png"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/ActionSheet/action-black-button-selected@2x.png"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/ActionSheet/action-black-button.png"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/ActionSheet/action-black-button@2x.png"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/ActionSheet/action-gray-button-selected.png"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/ActionSheet/action-gray-button-selected@2x.png"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/ActionSheet/action-gray-button.png"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/ActionSheet/action-gray-button@2x.png"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/ActionSheet/action-red-button-selected.png"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/ActionSheet/action-red-button-selected@2x.png"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/ActionSheet/action-red-button.png"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/ActionSheet/action-red-button@2x.png"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/ActionSheet/action-sheet-panel.png"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/ActionSheet/action-sheet-panel@2x.png"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/AlertView/alert-black-button.png"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/AlertView/alert-black-button@2x.png"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/AlertView/alert-gray-button.png"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/AlertView/alert-gray-button@2x.png"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/AlertView/alert-green-button.png"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/AlertView/alert-green-button@2x.png"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/AlertView/alert-red-button.png"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/AlertView/alert-red-button@2x.png"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/AlertView/alert-window-landscape.png"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/AlertView/alert-window-landscape@2x.png"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/AlertView/alert-window.png"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/AlertView/alert-window@2x.png"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/AlertView/alert-yellow-button.png"
install_resource "BlockAlertsAnd-ActionSheets/BlockAlertsDemo/images/AlertView/alert-yellow-button@2x.png"
install_resource "EGOTableViewPullRefresh/EGOTableViewPullRefresh/Resources/blackArrow.png"
install_resource "EGOTableViewPullRefresh/EGOTableViewPullRefresh/Resources/blackArrow@2x.png"
install_resource "EGOTableViewPullRefresh/EGOTableViewPullRefresh/Resources/blueArrow.png"
install_resource "EGOTableViewPullRefresh/EGOTableViewPullRefresh/Resources/blueArrow@2x.png"
install_resource "EGOTableViewPullRefresh/EGOTableViewPullRefresh/Resources/grayArrow.png"
install_resource "EGOTableViewPullRefresh/EGOTableViewPullRefresh/Resources/grayArrow@2x.png"
install_resource "EGOTableViewPullRefresh/EGOTableViewPullRefresh/Resources/whiteArrow.png"
install_resource "EGOTableViewPullRefresh/EGOTableViewPullRefresh/Resources/whiteArrow@2x.png"
install_resource "FlatUIKit/Resources/Lato-Black.ttf"
install_resource "FlatUIKit/Resources/Lato-BlackItalic.ttf"
install_resource "FlatUIKit/Resources/Lato-Bold.ttf"
install_resource "FlatUIKit/Resources/Lato-BoldItalic.ttf"
install_resource "FlatUIKit/Resources/Lato-Hairline.ttf"
install_resource "FlatUIKit/Resources/Lato-HairlineItalic.ttf"
install_resource "FlatUIKit/Resources/Lato-Italic.ttf"
install_resource "FlatUIKit/Resources/Lato-Light.ttf"
install_resource "FlatUIKit/Resources/Lato-LightItalic.ttf"
install_resource "FlatUIKit/Resources/Lato-Regular.ttf"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Images/bubble-default-incoming-green.png"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Images/bubble-default-incoming-green@2x.png"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Images/bubble-default-incoming-selected.png"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Images/bubble-default-incoming-selected@2x.png"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Images/bubble-default-incoming.png"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Images/bubble-default-incoming@2x.png"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Images/bubble-default-outgoing-green.png"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Images/bubble-default-outgoing-green@2x.png"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Images/bubble-default-outgoing-selected.png"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Images/bubble-default-outgoing-selected@2x.png"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Images/bubble-default-outgoing.png"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Images/bubble-default-outgoing@2x.png"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Images/bubble-square-incoming-selected.png"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Images/bubble-square-incoming-selected@2x.png"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Images/bubble-square-incoming.png"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Images/bubble-square-incoming@2x.png"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Images/bubble-square-outgoing-selected.png"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Images/bubble-square-outgoing-selected@2x.png"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Images/bubble-square-outgoing.png"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Images/bubble-square-outgoing@2x.png"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Images/bubble-typing.png"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Images/bubble-typing@2x.png"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Images/input-bar.png"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Images/input-bar@2x.png"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Images/input-field.png"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Images/input-field@2x.png"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Images/send-highlighted.png"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Images/send-highlighted@2x.png"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Images/send.png"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Images/send@2x.png"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Sounds/messageReceived.aiff"
install_resource "JSMessagesViewController/JSMessagesTableViewController/Resources/Sounds/messageSent.aiff"
install_resource "SVProgressHUD/SVProgressHUD/SVProgressHUD.bundle"
install_resource "SVWebViewController/SVWebViewController/SVWebViewController.bundle"

rsync -avr --no-relative --exclude '*/.svn/*' --files-from="$RESOURCES_TO_COPY" / "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
rm -f "$RESOURCES_TO_COPY"
