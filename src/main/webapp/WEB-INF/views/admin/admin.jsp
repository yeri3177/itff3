<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 사용자작성 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/guide/guide.css" />

<!-- 한글 깨지지 않게 하는 설정-->
<fmt:requestEncoding value="utf-8" />

<div class="container-fluid container-main">
											<button class="navbar-toggler toggler-toolbar toggler-burger collapsed collapse show" type="button" data-bs-toggle="collapse" data-bs-target="#subhead-container" aria-controls="subhead-container" aria-expanded="false" aria-label="Toolbar" style="">
				<span class="toggler-toolbar-icon"></span>
			</button>
			<div id="subhead-container" class="subhead mb-3 shadow-sm">
				<div class="row">
					<div class="col-md-12">
						<nav aria-label="Toolbar">
<div class="btn-toolbar d-flex" role="toolbar" id="toolbar">
</div>
</nav>

					</div>
				</div>
			</div>
				<section id="content" class="content">
						
			<div class="row">
				<div class="col-md-12">
					<main>
						<div id="system-message-container" aria-live="polite"></div>

						<script src="components/com_gridbox/assets/js/ba-admin.js?2.12.6" type="text/javascript"></script>
<script src="https://www.balbooa.com/demo-admin/components/com_gridbox/libraries/chart/chart.js" type="text/javascript"></script>
<script type="text/javascript">
    if (!window.Joomla) {
        window.Joomla = {};
    }
    app.store = {"notification":{"admins":[],"subject":"New Order On [Store Name]: [Order Number]","body":"<div style=\"background: #f9f9f9;width: 100%;padding-bottom: 50px;\">\n<div style=\"background: #1da6f4;width: 100%;\">\n<div style=\"margin: 0 auto;padding: 50px 0;max-width: 600px; width: 100%;\">\n<h1 style=\"color: #fff;font-size: 24px;font-weight: bold;text-align: center;\">Woohoo. You Got a New Order!<\/h1>\n\n<div style=\"margin: 50px auto 0;max-width: 90%;\">\n<h3 style=\"color: #fff;flex-grow: 1;font-size:14px;font-weight: bold;float: left;\">Order No. [Order Number]<\/h3>\n\n<p style=\"color: #fff;font-size:14px;font-weight: normal;float: right;\">[Order Date]<\/p>\n<\/div>\n<\/div>\n\n<div style=\"margin: 0 auto;max-width: 550px; width: 100%;background: #fff;\">\n<div style=\"background: #fff; margin-top: 10px;padding-top: 50px;padding-bottom: 0;max-width: 450px;margin-left: auto;margin-right: auto;\">\n<p style=\"color: #777;font-size: 12px;line-height: 2em;display: inline-block;\">You have received a new order from [Customer ID=1].<\/p>\n<\/div>\n<\/div>\n<\/div>\n\n<div style=\"margin: 0 auto;padding: 0;max-width: 550px; width: 100%;background: #fff;\">\n<div style=\"background: #fff;margin-bottom: 50px;padding-top: 50px;padding-bottom: 50px;max-width: 450px;margin-left: auto;margin-right: auto;\">\n<div style=\"border: 1px solid #f3f3f3;padding: 50px;max-width: 500px;margin-left: auto;margin-right: auto;\">[Order Details]<\/div>\n\n<div style=\"margin-top: 50px;\">\n<h3 style=\"font-size: 14px;font-weight: bold;\">Customer Info<\/h3>\n\n<p style=\"font-size: 12px;color: #777;line-height: 2em;\">Name: [Customer ID=1]<\/p>\n\n<p style=\"font-size: 12px;color: #777;line-height: 2em;\">Email: [Customer ID=3]<\/p>\n\n<p style=\"font-size: 12px;color: #777;line-height: 2em;\">Phone: [Customer ID=2]<\/p>\n\n<p style=\"font-size: 12px;color: #777;line-height: 2em;\">Address: [Customer ID=4], [Customer ID=5], [Customer ID=6], [Customer ID=7], [Customer ID=8]<\/p>\n<\/div>\n<\/div>\n<\/div>\n\n<h2 style=\"font-size: 24px;font-weight: bold;text-align: center;\">[Store Name]<\/h2>\n\n<p style=\"font-size: 12px;color: #777;text-align: center;\">[Store Legal Business Name], [Store Address]<\/p>\n\n<p style=\"font-size: 12px;color: #777;text-align: center;\">[Store Email] \/ [Store Phone]<\/p>\n<\/div>"},"stock":{"admins":[],"subject":"The [Product Title] is Running Out of Stock at [Store Name]","body":"<div style=\"background: #f9f9f9;width: 100%;padding-bottom: 50px;\">\n<div style=\"background: #1da6f4;width: 100%;\">\n<div style=\"margin: 0 auto;padding: 50px 0;max-width: 600px; width: 100%;\">\n<h1 style=\"color: #fff;font-size: 24px;font-weight: bold;text-align: center;\">Running Out of Stock<\/h1>\n<\/div>\n\n<div style=\"margin: 0 auto;max-width: 550px; width: 100%;background: #fff;\">\n<div style=\"background: #fff; margin-top: 10px;padding-top: 50px;padding-bottom: 0;max-width: 450px;margin-left: auto;margin-right: auto;\">\n<p style=\"color: #777;font-size: 12px;line-height: 2em;display: inline-block;\">The&nbsp;[Product Title] is running out of stock.<\/p>\n<\/div>\n<\/div>\n<\/div>\n\n<div style=\"margin: 0 auto;padding: 0;max-width: 550px; width: 100%;background: #fff;\">\n<div style=\"background: #fff;margin-bottom: 50px;padding-top: 50px;padding-bottom: 50px;max-width: 450px;margin-left: auto;margin-right: auto;\">\n<div style=\"margin-top: 50px;\">\n<h3 style=\"font-size: 14px;font-weight: bold;\">Product details<\/h3>\n\n<p style=\"font-size: 12px;color: #777;line-height: 2em;\"><span style=\"font-weight: bold;\">Product:<\/span> [Product Title]<\/p>\n\n<p style=\"font-size: 12px;color: #777;line-height: 2em;\"><span style=\"font-weight: bold;\">SKU:<\/span>&nbsp;[Product SKU]<\/p>\n\n<p style=\"font-size: 12px;color: #777;line-height: 2em;\"><span style=\"font-weight: bold;\">Quantity:<\/span>&nbsp;[Product Quantity]<\/p>\n<\/div>\n<\/div>\n<\/div>\n\n<h2 style=\"font-size: 24px;font-weight: bold;text-align: center;\">[Store Name]<\/h2>\n\n<p style=\"font-size: 12px;color: #777;text-align: center;\">[Store Legal Business Name], [Store Address]<\/p>\n\n<p style=\"font-size: 12px;color: #777;text-align: center;\">[Store Email] \/ [Store Phone]<\/p>\n<\/div>","quantity":3},"confirmation":{"name":"","email":"","subject":"Thank You for Your Order at [Store Name]","body":"<div style=\"background: #f9f9f9;width: 100%;padding-bottom: 50px;\">\n    <div style=\"background: #1da6f4;width: 100%;\">\n        <div style=\"margin: 0 auto;padding: 50px 0;max-width: 600px; width: 100%;\">\n            <h1 style=\"color: #fff;font-size: 24px;font-weight: bold;text-align: center;\">Thank You for Your Order!<\/h1>\n\n            <div style=\"margin: 50px auto 0;max-width: 90%;\">\n                <h3 style=\"color: #fff;flex-grow: 1;font-size:14px;font-weight: bold;float: left;\">Order No. [Order Number]<\/h3>\n\n                <p style=\"color: #fff;font-size:14px;font-weight: normal;float: right;\">[Order Date]<\/p>\n            <\/div>\n        <\/div>\n\n        <div style=\"margin: 0 auto;max-width: 550px; width: 100%;background: #fff;\">\n            <div style=\"background: #fff; margin-top: 10px;padding-top: 50px;padding-bottom: 0;max-width: 450px;margin-left: auto;margin-right: auto;\">\n                <p style=\"color: #777;font-size: 12px;line-height: 2em;display: inline-block;\">Hey [Customer ID=1],<br \/>\n                Your order has been received and is now being processed.<\/p>\n            <\/div>\n        <\/div>\n    <\/div>\n\n    <div style=\"margin: 0 auto;padding: 0;max-width: 550px; width: 100%;background: #fff;\">\n        <div style=\"background: #fff;margin-bottom: 50px;padding-top: 50px;padding-bottom: 50px;max-width: 450px;margin-left: auto;margin-right: auto;\">\n            <div style=\"border: 1px solid #f3f3f3;padding: 50px;max-width: 500px;margin-left: auto;margin-right: auto;\">[Order Details]<\/div>\n\n            <div style=\"margin-top: 50px;\">\n                <h3 style=\"font-size: 14px;font-weight: bold;\">Customer Info<\/h3>\n\n                <p style=\"font-size: 12px;color: #777;line-height: 2em;\">Name: [Customer ID=1]<\/p>\n\n                <p style=\"font-size: 12px;color: #777;line-height: 2em;\">Email: [Customer ID=3]<\/p>\n\n                <p style=\"font-size: 12px;color: #777;line-height: 2em;\">Phone: [Customer ID=2]<\/p>\n\n                <p style=\"font-size: 12px;color: #777;line-height: 2em;\">Address: [Customer ID=4], [Customer ID=5], [Customer ID=6], [Customer ID=7], [Customer ID=8]<\/p>\n            <\/div>\n        <\/div>\n    <\/div>\n\n    <h2 style=\"font-size: 24px;font-weight: bold;text-align: center;\">[Store Name]<\/h2>\n\n    <p style=\"font-size: 12px;color: #777;text-align: center;\">[Store Legal Business Name], [Store Address]<\/p>\n\n    <p style=\"font-size: 12px;color: #777;text-align: center;\">[Store Email] \/ [Store Phone]<\/p>\n<\/div>"},"completed":{"name":"","email":"","subject":"Your Order at [Store Name] Has Been Completed","body":"<div style=\"background: #f9f9f9;width: 100%;padding-bottom: 50px;\">\n    <div style=\"background: #1da6f4;width: 100%;\">\n        <div style=\"margin: 0 auto;padding: 50px 0;max-width: 600px; width: 100%;\">\n            <h1 style=\"color: #fff;font-size: 24px;font-weight: bold;text-align: center;\">Your Order Has Been Completed!<\/h1>\n\n            <div style=\"margin: 50px auto 0;max-width: 90%;\">\n                <h3 style=\"color: #fff;flex-grow: 1;font-size:14px;font-weight: bold;float: left;\">Order No. [Order Number] [Invoice: Attached]<\/h3>\n\n                <p style=\"color: #fff;font-size:14px;font-weight: normal;float: right;\">[Order Date]<\/p>\n            <\/div>\n        <\/div>\n\n        <div style=\"margin: 0 auto;max-width: 550px; width: 100%;background: #fff;\">\n            <div style=\"background: #fff; margin-top: 10px;padding-top: 50px;padding-bottom: 0;max-width: 450px;margin-left: auto;margin-right: auto;\">\n                <p style=\"color: #777;font-size: 12px;line-height: 2em;display: inline-block;\">Hey [Customer ID=1],<br \/>\n                Your order has been completed. Thanks for shopping with us!<\/p>\n            <\/div>\n        <\/div>\n    <\/div>\n\n    <div style=\"margin: 0 auto;padding: 0;max-width: 550px; width: 100%;background: #fff;\">\n        <div style=\"background: #fff;margin-bottom: 50px;padding-top: 50px;padding-bottom: 50px;max-width: 450px;margin-left: auto;margin-right: auto;\">\n            <div style=\"border: 1px solid #f3f3f3;padding: 50px;max-width: 500px;margin-left: auto;margin-right: auto;\">[Order Details]<\/div>\n\n            <div style=\"margin-top: 50px;\">\n                <h3 style=\"font-size: 14px;font-weight: bold;\">Customer Info<\/h3>\n\n                <p style=\"font-size: 12px;color: #777;line-height: 2em;\">Name: [Customer ID=1]<\/p>\n\n                <p style=\"font-size: 12px;color: #777;line-height: 2em;\">Email: [Customer ID=3]<\/p>\n\n                <p style=\"font-size: 12px;color: #777;line-height: 2em;\">Phone: [Customer ID=2]<\/p>\n\n                <p style=\"font-size: 12px;color: #777;line-height: 2em;\">Address: [Customer ID=4], [Customer ID=5], [Customer ID=6], [Customer ID=7], [Customer ID=8]<\/p>\n            <\/div>\n        <\/div>\n    <\/div>\n\n    <h2 style=\"font-size: 24px;font-weight: bold;text-align: center;\">[Store Name]<\/h2>\n\n    <p style=\"font-size: 12px;color: #777;text-align: center;\">[Store Legal Business Name], [Store Address]<\/p>\n\n    <p style=\"font-size: 12px;color: #777;text-align: center;\">[Store Email] \/ [Store Phone]<\/p>\n<\/div>"},"tax":{"mode":"excl","rates":[]},"currency":{"symbol":"\u20ac","code":"EUR","position":"right-currency-position","thousand":",","separator":".","decimals":"2"},"general":{"store_name":"","business_name":"","phone":"","email":"","country":"","region":"","street":"","city":"","zip_code":""},"statuses":[{"title":"Canceled","color":"#ff4f49","key":"1590650260323"},{"title":"Completed","color":"#34dca2","key":"completed"},{"title":"New","color":"#ffc700","key":"new"},{"title":"Processing","color":"#0098d8","key":"1590650260324"},{"title":"Refunded","color":"#35404a","key":"refunded"}],"checkout":{"login":true,"guest":true,"registration":true,"terms":true,"terms_text":"I have read and agree to the <a href=\"#\" target=\"_blank\">Terms and Conditions<\/a>","minimum":""},"wishlist":{"login":false},"units":{"weight":"kg"},"reminder":{"name":"","email":"","subject":"Your [Product Title] subscription expired on [Expiration Date]","body":"<div style=\"background: #f9f9f9;width: 100%;padding-bottom: 50px;\">\n    <div style=\"background: #1da6f4;width: 100%;\">\n        <div style=\"margin: 0 auto;padding: 50px 0;max-width: 600px; width: 100%;\">\n            <h1 style=\"color: #fff;font-size: 24px;font-weight: bold;text-align: center;\">Your Subscription Expires Soon<\/h1>\n        <\/div>\n\n        <div style=\"margin: 0 auto;max-width: 550px; width: 100%;background: #fff;\">\n            <div style=\"background: #fff; margin-top: 10px;padding-top: 50px;padding-bottom: 0;max-width: 450px;margin-left: auto;margin-right: auto;\">\n                <p style=\"color: #777;font-size: 12px;line-height: 2em;display: inline-block;\">Your [Product Title] subscription expired on [Expiration Date]<\/p>\n            <\/div>\n        <\/div>\n    <\/div>\n    <div style=\"margin: 0 auto;padding: 0;max-width: 550px; width: 100%;background: #fff;\">\n        <div style=\"background: #fff;margin-bottom: 50px;padding-top: 50px;padding-bottom: 50px;max-width: 450px;margin-left: auto;margin-right: auto;\">\n            <div style=\"margin-top: 10px;\">\n                <p style=\"font-size: 12px;color: #777;line-height: 2em;\">Renew your subscription to keep enjoying [Product Title]<\/p>\n                <p style=\"font-size: 12px;color: #777;line-height: 2em;\">If you have any questions, please don&#39;t hesitate to contact us at email@example.com<\/p>\n            <\/div>\n        <\/div>\n    <\/div>\n\n    <h2 style=\"font-size: 24px;font-weight: bold;text-align: center;\">[Store Name]<\/h2>\n    <p style=\"font-size: 12px;color: #777;text-align: center;\">[Store Legal Business Name], [Store Address]<\/p>\n    <p style=\"font-size: 12px;color: #777;text-align: center;\">[Store Email] \/ [Store Phone]<\/p>\n<\/div>"}};
</script>
<script src="https://www.balbooa.com/demo-admin/components/com_gridbox/libraries/calendar/js/calendar.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://www.balbooa.com/demo-admin/components/com_gridbox/libraries/calendar/css/calendar.css"><div id="ba-notification">
    <i class="zmdi zmdi-close"></i>
    <h4>Error</h4>
    <p></p>
</div>
<div id="export-dialog" class="ba-modal-sm modal hide" style="display:none">
    <div class="modal-header">
        <h3 class="ba-modal-header">Export</h3>
    </div>
    <div class="modal-body">
        <div>
            <ul>
                <li>
                    <label>
                        Pages                    </label>
                    <label class="ba-checkbox ba-hide-checkbox">
                        <input type="checkbox" checked="" disabled="">
                        <i class="zmdi zmdi-check"></i>
                        <span></span>
                    </label>
                </li>
                <li>
                    <label>
                        Theme                    </label>
                    <label class="ba-checkbox ba-hide-checkbox">
                        <input type="checkbox" checked="" disabled="">
                        <i class="zmdi zmdi-check"></i>
                        <span></span>
                    </label>
                </li>
                <li class="export-apps">
                    <label>
                        App                    </label>
                    <label class="ba-checkbox ba-hide-checkbox">
                        <input type="checkbox" checked="" disabled="">
                        <i class="zmdi zmdi-check"></i>
                        <span></span>
                    </label>
                </li>
                <li>
                    <label>
                        Joomla! Menu                    </label>
                    <label class="ba-checkbox ba-hide-checkbox">
                        <input type="checkbox" class="menu-export">
                        <i class="zmdi zmdi-check"></i>
                        <span></span>
                    </label>
                </li>
            </ul>
        </div>
    </div>
    <div class="modal-footer">
        <a href="#" class="ba-btn" data-dismiss="modal">Cancel</a>
        <a href="#" class="ba-btn-primary apply-export">Save</a>
    </div>
</div><div id="uploader-modal" class="ba-modal-lg modal ba-modal-dialog hide" style="display:none" data-check="multiple">
    <div class="modal-body">
        <iframe src="javascript:''" name="uploader-iframe"></iframe>
        <input type="hidden" data-dismiss="modal">
    </div>
</div>
<form autocomplete="off" action="/demo-admin/administrator/index.php?option=com_gridbox" method="post" name="adminForm" id="adminForm">
    <div class="row-fluid">
        <div id="gridbox-container">
            <div id="gridbox-content">
<script src="https://www.balbooa.com/demo-admin/components/com_gridbox/libraries/bootstrap/bootstrap.js" type="text/javascript"></script>
<script type="text/javascript">
var JUri = 'https://www.balbooa.com/demo-admin/',
    IMAGE_PATH = 'images';
var gridboxLanguage = {"EDIT_NOT_PERMITTED":"Edit not permitted.","CREATE_NOT_PERMITTED":"Create not permitted.","SAVE_SUCCESS":"Item saved.","TITLE":"Title","SHORT_M1":"Jan","SHORT_M2":"Feb","SHORT_M3":"Mar","SHORT_M4":"Apr","SHORT_M5":"May","SHORT_M6":"Jun","SHORT_M7":"Jul","SHORT_M8":"Aug","SHORT_M9":"Sep","SHORT_M10":"Oct","SHORT_M11":"Nov","SHORT_M12":"Dec","2_4_BUSINESS_DAYS":"2 - 4 business days","ABOUT_GRIDBOX":"About Gridbox","ACTIVATE":"Activate","ACTIVATE_LICENSE":"Activate license","ACTIVE":"Active","ADD_AUTHOR":"Add Author","ADD_CATEGORY":"Add Category","ADD_COUNTRY":"Add Country","ADD_EMAIL_AND_PRESS_ENTER":"Add an email and press enter","ADD_IMAGE":"Add Image","ADD_NEW_ITEM":"Add New Item","ADD_NEW_RANGE":"Add New Range","ADD_REGION":"Add Region","ADD_TAG":"Add Tag","ADD_TRACKING_INFO":"Add Tracking Info","ADJUST":"Adjust","ADMIN_EMAIL":"Admin Email","ADMIN_LABEL":"Admin Label","ADMIN_NOTIFICATION_NEW_ORDER":"Admin Notification: New Order","ADMIN_NOTIFICATION_OUT_OF_STOCK":"Admin Notification: Out of Stock","ADMINS":"Admins","ALIGNMENT":"Alignment","ALL_PRODUCTS":"All Products","ALLOWED_FILE_TYPES":"Allowed File Types","ALREADY_INSTALLED":"Already installed","ALWAYS":"Always","AMOUNT":"Amount","ANOTHER_ALIAS":"Save failed with the following error: Another item has the same alias.","ANTI_SPAM":"Anti-spam","APP":"App","APPLIES_TO":"Applies To","APPLY":"Apply","APPROVE":"Approve","APPROVED":"Approved","APPS":"Apps","ARE_YOU_SURE_DEACTIVATE":"Are you sure you want to deactivate the license? The site will no longer receive updates.","ASPECT_RATIO":"Aspect Ratio","ATTACHMENTS":"Attachments","ATTACHMENTS_TOOLTIP":"Allows users to attach files and images to their posts.","AUTHOR":"Author","AUTHORS":"Authors","AUTO_DELETING":"Auto-Deleting","AUTO_DELETING_TOOLTIP":"Submissions with banned words, emails, IP addresses and links will be deleted automatically","AVAILABLE":"Available","BACK":"Back","BAN_USER":"Ban User","BANNED_EMAILS":"Banned Emails","BANNED_IP_ADDRESSES":"Banned IP Addresses","BANNED_WORDS":"Banned Words","BASIC":"Basic","BILLED_TO":"Billed to","BLOCK_LINKS":"Block links","BLOG":"Blog","BLUR":"Blur","BRIGHTNESS":"Brightness","BROWSE_PICTURE":"Browse Picture","BROWSER_PAGE_TITLE":"Browser Page Title","CANCEL":"Cancel","CANNOT_DELETE_DEFAULT":"You cannot delete the default theme","CANONICAL":"Canonical URLs","CANT_DELETE_DEFAULT_THEME":"You cannot delete the Default theme","CARRIER":"Carrier","CATEGORIES":"Categories","CATEGORY":"Category","CATEGORY_LIST_LAYOUT":"Category List Layout","CATEGORY_NAME":"Enter Category Name","CHANGED_STATUS_TO":"Changed status to","CHECKBOX":"Checkbox","CHECKOUT":"Checkout","CITY":"City","CLASS_SUFFIX":"Class Suffix","CLASS_SUFFIX_TOOLTIP":"By adding a CSS suffix to the item, you can customize the style of the item by writing your own CSS.","CLOSE":"Close","CODE":"Code","CODE_EDITOR":"Code Editor","COLOR_PICKER":"Color Picker","COLUMN":"Column","COM_GRIDBOX":"Gridbox","COM_GRIDBOX_N_ITEMS_APPROVED":"Item(s) was successfully approved","COM_GRIDBOX_N_ITEMS_DELETED":"Item(s) was successfully deleted","COM_GRIDBOX_N_ITEMS_IMPORTED":"Item(s) was successfully imported","COM_GRIDBOX_N_ITEMS_PUBLISHED":"Item(s) was successfully published","COM_GRIDBOX_N_ITEMS_RESTORED":"Item(s) was successfully restored","COM_GRIDBOX_N_ITEMS_SPAMED":"Item(s) was successfully moved to the spam","COM_GRIDBOX_N_ITEMS_TRASHED":"Page(s) trashed.","COM_GRIDBOX_N_ITEMS_UNPUBLISHED":"Item(s) was successfully unpublished","COM_MENUS":"Joomla! Menu","COMMA":"Comma","COMMENTS":"Comments","CONTACT_INFO":"Contact Info","CONTRAST":"Contrast","COOKIES":"Cookies","COPY_TO_CLIPBOARD":"\u0421opy to clipboard","COUNT":"Count","COUNTRY":"Country","COUPON_CODE":"Coupon Code","COUPON_RESTRICTIONS":"Coupon Restrictions","RESTRICTIONS":"Restrictions","CREATE_AN_APP":"Create an App","CREATE_CATEGORY":"Create Category","CREATE_FOLDER":"Create Folder","CREATE_NEW_PAGE":"Create New Page","CREATE_STORE_BACKUP_BEFORE_IMPORT":"Create store backup before import","CROP":"Crop","CURRENCY":"Currency","CURRENCY_SEPARATOR":"Currency Separator","CURRENCY_UNITS":"Currency and Units","CUSTOM":"Custom","CUSTOMER":"Customer","CUSTOMER_INFO":"Customer Info","CUSTOMER_LOGIN":"Customer Login","CUSTOMER_NOTIFICATION_ORDER_COMPLETED":"Customer Notification: Order Completed","CUSTOMER_NOTIFICATION_ORDER_CONFIRMATION":"Customer Notification: Order Confirmation","CUSTOMER_NOTIFICATION_SUBSCRIPTION_REMINDER":"Customer Notification: Expiration and Renewal Reminder","DAILY":"Daily","DASHBOARD":"Dashboard","DATA_TAGS":"Data Tags","DATE":"Date","DATE_LIMITATIONS":"Date Limitations","DAYS":"Days","DEACTIVATE":"Deactivate","DECIMAL_SEPARATOR":"Decimal Separator","DEFAULT_THEME":"Default Theme","DEFAULT_WEIGHT_UNIT":"Default Weight Unit","DELETE":"Delete","DELETE_APP":"Delete App","DELETE_ITEM":"Delete Item","DELIVERY_COST":"Delivery cost","DELIVERY_COST_PER_WEIGHT_UNIT":"Delivery cost per weight unit","DELIVERY_COST_PRODUCT_UNIT":"Delivery cost for one product unit","DESCRIPTION":"Description","DIGITAL":"Digital","DISABLE_FOR_DISCOUNT":"Disable for discount products","DISCOUNT":"Discount","DISCOUNTS":"Discounts","DOT":"Dot","DOWNLOAD":"Download","DOWNLOAD_FILE":"Download File","DRAG_DROP_SORT_ITEMS":"Sort Items by Drag and Drop","DROPDOWN":"Dropdown","DUPLICATE":"Duplicate","EDIT":"Edit","EDIT_LAYOUTS":"Edit Layouts","EMAIL":"Email","EMAIL_EDITOR":"Email Editor","EMAIL_NOTIFICATIONS":"Email Notifications","ENABLE_GRIDBOX_SYSTEM_PLUGIN":"Please enable Gridbox System plugin.","ENABLE_HEADER_FOOTER":"Enable Header and Footer","END_DATE":"End Date","END_DESC":"Set the date and time when you want to end publishing the item.","END_PUBLISHING":"End Publishing","ENTER_APP_NAME":"Enter an App name","ENTER_AUTHOR_NAME":"Enter Author Name","ENTER_FILE_NAME":"Enter file name","ENTER_FOLDER_NAME":"Enter folder name","ENTER_TAG_NAME":"Enter tag name","ENTER_VALID_VALUE":"Please enter a valid value","ERRORS":"Errors","EST_DELIVERY_TIME":"Est delivery time","EXPIRED":"Expired","EXPIRES":"Expires","EXPORT":"Export","EXTRA_OPTIONS":"Extra Options","FEATURED":"Featured","FILE_SIZE":"File Size","FILTER_AND_EFFECTS":"Filter and Effects","FLAT_RATE":"Flat Rate","FLIP_HORIZONTAL":"Flip Horizontal","FLIP_ROTATE":"Flip and Rotate","FLIP_VERTICAL":"Flip Vertical","FOLDER_IS_CREATED":"The folder was created successfully","FREE":"Free","FREE_SHIPPING":"Free Shipping","FROM":"From","FULLSCREEN":"Fullscreen","GENERAL":"General","GENERAL_INFO":"General Info","GRAMS":"Grams (g)","GRAYSCALE":"Grayscale","GRIDBOX":"Gridbox","GRIDBOX_CSV_FILE":"Gridbox CSV File","GRIDBOX_DUPLICATED":"Item(s) was successfully duplicated","GRIDBOX_IS_UP_TO_DATE":"Gridbox is up to date","GUEST_CHECKOUT":"Guest Checkout","HEIGHT":"Height","HOURLY":"Hourly","HOURS":"Hours","IMAGE":"Image","IMAGE_ALT":"Image Alt","IMAGE_PICKER":"Image Picker","IMAGE_QUALITY":"Quality","IMPORT":"Import","IMPORT_EXPORT_CSV":"Import \/ Export CSV","IMPORT_JOOMLA_CONTENT":"Import Joomla Content","IMPORT_PAGES_THEMES_TOOLTIP":"Import a previously exported Gridbox Pages and Themes. Select .xml file to import.","IN_STOCK":"In Stock","INCLUDE_ITEM":"Include Item","INCLUDE_ITEM_TOOLTIP":"Disable an option if you want to exclude an item from the sitemap","INCLUDES":"Includes","INCLUDING_TAXES":"Including Taxes","INCORRECT_USERNAME_PASSWORD":"The Username or Password is incorrect!","INSERT_SELECTED_ITEMS":"Insert Selected Items","INSTALL":"Install","INSTALLED":"Installed","INSTALLING":"Installing. Please wait...","INTEGRATIONS":"Integrations","INTRO_TEXT":"Intro Text","INVALID_DATA_TYPE":"Invalid Data Type","INVOICE":"Invoice","INVOICE_ATTACHED":"Invoice: Attached","IP_TRACKING":"IP Tracking","IP_TRACKING_TOOLTIP":"Enable option to view user IP address","ITEM_CREATED":"The item was created successfully","KEEP_PROPORTIONS":"Keep Proportions","KILOGRAMS":"Kilograms (kg)","LANGUAGE_DESC":"The language that the item is assigned to.","LANGUAGES":"Languages","LAYOUT_EDITING":"Layout Editing","LEFT":"Left","LEGAL_BUSINESS_NAME":"Legal Business Name","LICENSE_DEACTIVATION":"License Deactivation","LINE":"Line","LINK":"Link","LOADING":"Loading. Please wait...","LOGIN_TOOLTIP":"Enter your Balbooa username and password into the relevant fields","MATCH_FIELDS":"Match Fields","MAX_UPLOAD_FILE_SIZE":"Max Upload File Size, kb","MEDIA":"Media","MEDIA_MANAGER":"Media Manager","MINIMUM_ORDER_AMOUNT":"Minimum order amount","MINIMUM_STOCK_QUANTITY":"Minimum stock quantity","MODAL_DELETE":"Are you sure that you want to delete this?","MONTH":"Month","MONTHLY":"Monthly","MONTHS":"Months","MOVE_TO":"Move To","NAME":"Name","NET_PRICE":"Net Price","NEVER":"Never","NEW_ORDER":"New Order","NEW_PRODUCTS":"New Products","NEXT":"Next","NO_ITEMS_FOUND":"No items found","NO_ITEMS_HERE":"You have no items here","NONE_SELECTED":"None","NOT_ALLOWED_FILE_SIZE":"The file(s) size exceeded the maximum upload size","NOT_SUPPORTED_FILE":"Not supported file format","NOTIFICATIONS":"Notifications","NUMBER_OF_DECIMALS":"Number of Decimals","OFFER_FREE_SHIPPING_OVER_AMOUNT":"Offer Free shipping over the amount","ONLY_FOR_GUEST":"Only For Guest","ONLY_FOR_GUEST_TOOLTIP":"Display reCAPTCHA only for non-registered users","OPACITY":"Opacity","OPTIONS":"Options","ORDER":"Order","ORDER_DATE":"Order Date","ORDER_DETAILS":"Order Details","ORDER_NUMBER":"Order Number","ORDER_STATUS":"Order Status","ORDER_STATUSES":"Order Statuses","ORDERS":"Orders","ORDERS_HISTORY":"Orders History","ORIGINAL":"Original","OVERWRITE_PRODUCTS_WITH_SAME_ID":"Overwrite products with the same ID","PAGE":"Page","PAGE_DESC":"Display Gridbox page in front end","PAGES":"Pages","PASSWORD":"Password","PATH_TO_FOLDER":"Path to folder","PAYMENT":"Payment","PAYMENT_METHODS":"Payment Methods","PENDING":"Pending","PERCENTAGE":"Percentage","PERFORMANCE":"Performance","PHONE":"Phone","PHOTO_EDITOR":"Photo Editor","PHOTOS":"Photos","PHOTOS_TOOLTIP":"Allows users to attach photos to their posts.","PHYSICAL":"Physical","POSITION":"Position","POUNDS":"Pounds (lb)","PRELIMINARY_IMPORT_CHECK":"Preliminary Import Check","PRELOADER":"Preloader","PREV":"Prev","PRICE":"Price","PRINT":"Print","PRODUCT":"Product","PRODUCT_OPTIONS":"Product Options","PRODUCT_QUANTITY":"Product Quantity","PRODUCT_SKU":"Product SKU","PRODUCT_TITLE":"Product Title","PROFILE_PICTURE":"Profile Picture","PROMO_CODES":"Promo Codes","PUBLISHING":"Publishing","QTY":"Qty","RADIO":"Radio","RATE_BY_PRICE":"Rate by Price","RATE_BY_WEIGHT_RANGE":"Rate by Weight Range","RATE_BY_WEIGHT_UNIT":"Rate per Weight Unit","RATE_PER_CATEGORY":"Rate per Category","RATE_PER_PRODUCT":"Rate per Product","RATING":"Rating","RECENT_COMMENTS":"Recent Comments","RECENT_FILES":"Recent Files","RECENT_REVIEWS":"Recent Reviews","RECENTLY_OPENED":"Recently Opened","REFUNDS":"Refunds","REGIONS":"Regions","RENAME":"Rename","RENEW":"Renew","REPLY":"Reply","REQUIRED":"Required","REQUIRED_COLUMN_NOT_PRESENT":"The required column not present","RESET":"Reset","RESET_FILTER":"Reset Filter","RESIZE":"Resize","RESTORE":"Restore","RESTRICTED":"Restricted","REVIEWS":"Reviews","RIGHT":"Right","ROOT":"Root","ROTATE_LEFT":"Rotate Left","ROTATE_RIGHT":"Rotate Right","SALES_STATISTICS":"Sales","SATURATE":"Saturate","SAVE_AS_WEBP":"Save as WebP","SAVE_COPY":"Save as Copy","SAVE_COPY_NOTICE":"The file already exists. Do you want to overwrite it?","SAVING":"Saving. Please wait...","SELECT":"Select","SELECT_APP_TO_IMPORT_ARTICLES":"Select an app to import articles","SELECT_CSV_FILE":"Select a CSV file","SELECT_GROUP":"Select Group","SELECT_PAGE":"Select Page","SELECT_USER":"Select User","SEPARATOR":"Separator","SEPIA":"Sepia","SETTINGS":"Settings","SHARING":"Sharing","SHIPPING":"Shipping","SHIPPING_REGIONS":"Shipping Regions","SINGLE_POST_LAYOUT":"Single Post Layout","SITEMAP":"Sitemap","SKU":"SKU","SOCIAL_LINKS":"Social Links","SORT_BY_COLUMN":"Sort by this column","SPACE":"Space","SPAM":"Spam","SPAM_FILTERS":"Spam filters","STAR_RATINGS":"Star Rating","START_DATE":"Start Date","START_DESC":"Set the date and time when you want to start publishing the item.","START_PUBLISHING":"Start Publishing","STATE_PROVINCE":"State \/ Province","STEP_1":"Step 1","STEP_2":"Step 2","STEP_3":"Step 3","STORE":"Store","STORE_ADDRESS":"Store Address","STORE_EMAIL":"Store Email","STORE_LEGAL_NAME":"Store Legal Business Name","STORE_NAME":"Store Name","STORE_PHONE":"Store Phone","STORE_PICKUP":"Store Pickup","STORE_SETTINGS":"Store Settings","STORE_STATISTICS":"Store Statistics","STREET_ADDRESS":"Street Address","SUBJECT":"Subject","SUBMISSIONS_PREMODERATION":"Submissions pre-moderation","SUBMISSIONS_PREMODERATION_TOOLTIP":"Moderators must approve a submission before it is publishing","SUBSCRIPTION":"Subscription","SUBSCRIPTION_ALREADY_USE":"This subscription is already in use or you have exceeded the maximum number of allowed activations.","SUBSCRIPTION_DETAILS":"Subscription Details","SUBSCRIPTION_EXPIRED":"Your subscription has expired and you have to renew it","SUBSCRIPTION_INFO":"Subscription Info","SUBSCRIPTION_RENEWED_SUCCESSFULLY":"Subscription renewed successfully","SUBSCRIPTIONS":"Subscriptions","SUBTOTAL":"Sub Total","SUCCESS_DELETE":"Item has been successfully deleted","SUCCESS_INSTALL":"The installation was successful","SUCCESS_MOVED":"Item has been successfully moved","SUCCESS_RENAME":"Item has been successfully renamed","SUCCESS_UPLOAD":"Item(s) uploaded successfully","SUCCESSFULLY_BANNED":"The user has been successfully banned","SUCCESSFULLY_COPIED_TO_CLIPBOARD":"Successfully copied to clipboard","SUCCESSFULY_DEACTIVATED":"You have successfully deactivated a license for this domain","SYMBOL":"Symbol","SYSTEM_PAGES":"System Pages","TAG":"Tag","TAGS":"Tags","TAGS_DESC":"Assign tags to pages. Enter the new tag by typing the name and pressing Enter.","TAX":"Tax","TAX_EXCLUSIVE":"Tax Exclusive","TAX_INCLUSIVE":"Tax Inclusive","TAX_MODE":"Tax Mode","TAX_ON_SHIPPING":"Tax on Shipping","TAX_RATE":"Tax Rate","TAXES_RATES":"Taxes and Rates","TERMS_AND_CONDITIONS_CHECKBOX":"Terms and Conditions Checkbox","TERMS_AND_CONDITIONS_TEXT":"Terms and Conditions Text","THEME":"Theme","THEME_SETTINGS":"Theme Settings","THEMES":"Themes","THIS_FIELD_REQUIRED":"This field is required","THOUSAND_SEPARATOR":"Thousand Separator","TO":"To","TOP_10":"Top 10","TOTAL":"Total","TRACKING_CARRIER":"Tracking Carrier","TRACKING_NUMBER":"Tracking Number","TRACKING_URL":"Tracking URL","TRASH":"Trash","TRASHED_ITEMS":"Trashed Items","TYPE":"Type","UNITS":"Units","UP_TO":"Up To","UPDATE":"Update","UPDATE_AVAILABLE":"Update Available","UPDATED":"Extension was successfully updated","UPDATED_ERROR":"The extension has not been updated. Please try again","UPDATED_PRODUCTS":"Updated","UPDATING":"Updating...","UPLOAD":"Upload","UPLOAD_ERROR":"Couldn't be uploaded. Incorrect file type. Pages and Themes should be uploaded as XML file.","UPLOAD_FILE":"Upload File","UPLOAD_IMAGE":"Upload Image","UPLOAD_THEME":"Upload Theme","UPLOADING_MEDIA":"Uploading Media...","USAGE_LIMIT":"Usage Limit","USED":"Used","USER":"User","USER_CANNOT_BE_BANNED":"User cannot be banned. Missing email and IP address.","USER_GROUPS":"User Groups","USER_NOTIFICATIONS":"User Notifications","USER_NOTIFICATIONS_TOOLTIP":"Users will receive email notifications when someone has reply to his submission","USER_REGISTRATION_FORM":"User Registration Form","USERGROUP":"User Group","USERNAME":"Username","USERNAME_ALREADY_USE":"This username is already in use","VALUES":"Values","VIEW":"View","VIEW_ERRORS":"View Errors","VIEWS":"Views","VOTES":"Votes","WEEKLY":"Weekly","WIDTH":"Width","WISHLIST":"Wishlist","WISHLIST_ONLY_AUTHENTICATED":"Only for authenticated users","WRITE_COMMENT_HERE":"Write your comment here...","YEAR":"Year","YEARLY":"Yearly","YEARS":"Years","YOUR_LICENSE_ACTIVE":"Your license is active","ZIP_CODE":"Zip Code","EXPIRATION_DATE":"Expiration Date","FROM_NAME":"From Name","FROM_EMAIL":"From Email","GROUP":"Group","DRAG_IT_OUT_UNGROUP":"Drag it out to ungroup"};</script>
<div class="ba-sidebar">
    <div>
        <span class="toggle-sidebar">
            <a href="#">
                <span class="zmdi zmdi-format-clear-all"></span>
            </a>
        </span>
    </div>
    <div>
        <span class="dashboard active">
            <a href="index.php?option=com_gridbox">
                <span class="zmdi zmdi-home"></span>
                <span class="sidebar-title">Dashboard</span>
            </a>
            <span class="ba-tooltip ba-right ba-hide-element">Dashboard</span>
        </span>
        <span class="app-list sidebar-context-parent " data-context="apps-list-context-menu">
            <a href="index.php?option=com_gridbox&amp;view=appslist">
                <span class="zmdi zmdi-widgets"></span>
                <span class="sidebar-title">Apps</span>
                <i class="zmdi zmdi-caret-right"></i>
            </a>
        </span>
        <span class="gridbox-themes ">
            <a href="index.php?option=com_gridbox&amp;view=themes">
                <span class="zmdi zmdi-format-color-fill"></span>
                <span class="sidebar-title">Themes</span>
            </a>
            <span class="ba-tooltip ba-right ba-hide-element">Themes</span>
        </span>
        <div class="ba-system-actions">
            <span class="gridbox-store sidebar-context-parent " data-context="store-context-menu">
                <a href="index.php?option=com_gridbox&amp;view=orders">
                    <span class="zmdi zmdi-shopping-cart"></span>
                    <span class="sidebar-title">Store</span>
                    <i class="zmdi zmdi-caret-right"></i>
                </a>
            </span>


            <span class="app ">
                <a href="index.php?option=com_gridbox&amp;view=comments">
                    <span class="zmdi zmdi-comment-more"></span>
                    <span class="sidebar-title">Comments</span>
                </a>
                <span class="ba-tooltip ba-right ba-hide-element">Comments</span>
            </span>
            <span class="app ">
                <a href="index.php?option=com_gridbox&amp;view=reviews">
                    <span class="zmdi zmdi-ticket-star"></span>
                    <span class="sidebar-title">Reviews</span>
                </a>
                <span class="ba-tooltip ba-right ba-hide-element">Reviews</span>
            </span>
            <span class="authors-pages ">
                <a href="index.php?option=com_gridbox&amp;view=authors">
                    <span class="zmdi zmdi-account-circle"></span>
                    <span class="sidebar-title">Authors</span>
                </a>
                <span class="ba-tooltip ba-right ba-hide-element">Authors</span>
            </span>
            <span class="app ">
                <a href="index.php?option=com_gridbox&amp;view=tags">
                    <span class="zmdi zmdi-label"></span>
                    <span class="sidebar-title">Tags</span>
                </a>
                <span class="ba-tooltip ba-right ba-hide-element">Tags</span>
            </span>
        </div>
        <span class="system-pages ">
            <a href="index.php?option=com_gridbox&amp;view=system">
                <span class="zmdi zmdi-alert-polygon"></span>
                <span class="sidebar-title">System Pages</span>
            </a>
            <span class="ba-tooltip ba-right ba-hide-element">System Pages</span>
        </span>
        <span class="trashed-items ">
            <a href="index.php?option=com_gridbox&amp;view=trashed">
                <span class="zmdi zmdi-delete"></span>
                <span class="sidebar-title">Trashed Items</span>
            </a>
            <span class="ba-tooltip ba-right ba-hide-element">Trashed Items</span>
        </span>
        <span class="gridbox-options sidebar-context-parent" data-context="options-context-menu">
            <a href="#">
                <span class="zmdi zmdi-settings"></span>
                <span class="sidebar-title">Options</span>
                <i class="zmdi zmdi-caret-right"></i>
            </a>
        </span>
    </div>
</div>
<div id="login-modal" class="ba-modal-sm modal hide">
    <div class="modal-body">
        <div class="ba-login-dialog">
            <div class="ba-header-content">
                <h3 class="ba-modal-header">
                    Activate license                </h3>
                <label class="ba-help-icon">
                    <i class="zmdi zmdi-help"></i>
                    <span class="ba-tooltip ba-help ba-hide-element">
                        Enter your Balbooa username and password into the relevant fields                    </span>
                </label>
            </div>
            <div class="ba-body-content">
                <div class="ba-input-lg">
                    <input class="ba-username reset-input-margin" type="text" autocomplete="off" placeholder="Username">
                    <span class="focus-underline"></span>
                </div>
                <div class="ba-input-lg">
                    <input class="ba-password" type="password" name="ba-password" autocomplete="off" placeholder="Password">
                    <span class="focus-underline"></span>
                </div>
                <input type="hidden" id="theme-id">
            </div>
            <div class="ba-footer-content">
                <a href="#" class="ba-btn-primary login-button active-button">
                    Activate                </a>
            </div>
        </div>
    </div>
</div>
<div class="ba-context-menu apps-list-context-menu" data-source="app-list" style="left: 347px; --context-top:152px; display: none;">
    <span class="context-menu-item-link" data-id="0">
        <a href="index.php?option=com_gridbox&amp;view=pages" class="default-action">
            <i class="zmdi zmdi-file"></i>
            <span>
                Pages            </span>
        </a>
    </span>
    <span class="context-menu-item-link" data-id="3">
        <a href="index.php?option=com_gridbox&amp;view=apps&amp;id=3" class="default-action">
            <i class="zmdi zmdi-format-color-text"></i>
            <span>
                Blog            </span>
        </a>
    </span>
    <span class="context-menu-item-link" data-id="14">
        <a href="index.php?option=com_gridbox&amp;view=apps&amp;id=14" class="default-action">
            <i class="zmdi zmdi-crop-free"></i>
            <span>
                Zero App            </span>
        </a>
    </span>
    <span class="context-menu-item-link" data-id="15">
        <a href="index.php?option=com_gridbox&amp;view=apps&amp;id=15" class="default-action">
            <i class="zmdi zmdi-camera"></i>
            <span>
                Portfolio            </span>
        </a>
    </span>
    <span class="context-menu-item-link" data-id="16">
        <a href="index.php?option=com_gridbox&amp;view=apps&amp;id=16" class="default-action">
            <i class="zmdi zmdi-hotel"></i>
            <span>
                Hotel Rooms            </span>
        </a>
    </span>
    <span class="context-menu-item-link" data-id="17">
        <a href="index.php?option=com_gridbox&amp;view=apps&amp;id=17" class="default-action">
            <i class="zmdi zmdi-shopping-basket"></i>
            <span>
                Products            </span>
        </a>
    </span>
</div>
                <div class="ba-main-view">
                    <div id="filter-bar">
                        <div class="app-title-wrapper">
                            <h1>Dashboard</h1>
                            <span class="ba-dashboard-popover-trigger" data-target="ba-dashboard-apps-list">
                                <i class="zmdi zmdi-plus-circle"></i>
                                <span class="ba-tooltip ba-top ba-hide-element">Add New Item</span>
                            </span>
                        </div>
                        <div class="filter-dashboars-icons-wrapper">
                            <span class="ba-dashboard-popover-trigger" data-target="ba-dashboard-about">
                                <i class="zmdi zmdi-info" "=""></i>
                                <span class="about-notifications-count" style="display: none;">
                                0</span>
                                <span class="ba-tooltip ba-top ba-hide-element">About Gridbox</span>
                            </span>
                            <span class="gridbox-languages">
                                <i class="zmdi zmdi-globe"></i>
                                <span class="ba-tooltip ba-top ba-hide-element">Languages</span>
                            </span>
                        </div>
                    </div>
                    <div class="main-table dashboard-content">
                        <div class="row-fluid">
                            <div class="span12 ba-store-statistic">
                                <div class="ba-store-statistic-header">
                                    <div class="ba-store-statistic-header-title-wrapper">
                                        <span class="ba-store-statistic-header-title">Store Statistics</span>
                                    </div>
                                    <div class="ba-store-statistic-header-filter-wrapper">
                                        <div class="ba-store-statistic-action-wrapper">
                                            <span class="ba-store-statistic-action" data-action="-">
                                                <i class="zmdi zmdi-caret-left"></i>
                                                <span class="ba-tooltip ba-top ba-hide-element">Prev</span>
                                            </span>
                                            <span class="ba-store-statistic-custom-action">
                                                <input type="hidden" class="open-calendar-dialog" data-format="Y-m-d" data-type="range-dates" data-key="from" data-created="true">
                                                <i class="zmdi zmdi-calendar-alt"></i>
                                            </span>
                                        </div>
                                        <div class="ba-store-statistic-select-wrapper">
                                            <div class="ba-custom-select ba-store-statistic-select">
                                                <input readonly="" type="text" value="Dec 16, 2021">
                                                <input type="hidden" value="d" data-current="2021-12-16">
                                                <ul>
                                                    <li data-value="d" data-text="Dec 16, 2021">
                                                        Daily                                                    </li>
                                                    <li data-value="w" data-text="Dec 09, 2021 - Dec 15, 2021">
                                                        Weekly                                                    </li>
                                                    <li data-value="m" data-text="Monthly, 2021">
                                                        Monthly                                                    </li>
                                                    <li data-value="y" data-text="Yearly">
                                                        Yearly                                                    </li>
                                                    <li data-value="c" data-text="Dec 16, 2021 - Dec 16, 2021">
                                                        Custom                                                    </li>
                                                </ul>
                                                <i class="zmdi zmdi-caret-down"></i>
                                            </div>
                                        </div>
                                        <div class="ba-store-statistic-action-wrapper">
                                            <span class="ba-store-statistic-action ba-disabled" data-action="+">
                                                <i class="zmdi zmdi-caret-right"></i>
                                                <span class="ba-tooltip ba-top ba-hide-element">Next</span>
                                            </span>
                                            <span class="ba-store-statistic-custom-action">
                                                <input type="hidden" class="open-calendar-dialog" data-format="Y-m-d" data-type="range-dates" data-key="to" data-created="true">
                                                <i class="zmdi zmdi-calendar-alt"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="ba-store-statistic-body">
                                    <div class="row-fluid ba-store-statistic-total-wrapper">
                                        <div class="span8">
                                            <div class="ba-store-statistic-count-wrapper" data-type="orders" style="--statistic-count-color: #ffc700;">
                                                <span class="ba-store-statistic-count">0</span>
                                                <span class="ba-store-statistic-text">Orders</span>
                                            </div>
                                            <div class="ba-store-statistic-count-wrapper" data-type="completed" style="--statistic-count-color: #34dca2;">
                                                <span class="ba-store-statistic-count">0</span>
                                                <span class="ba-store-statistic-text">Sales</span>
                                            </div>
                                            <div class="ba-store-statistic-count-wrapper" data-type="refunded" style="--statistic-count-color: #35404a;">
                                                <span class="ba-store-statistic-count">0</span>
                                                <span class="ba-store-statistic-text">Refunds</span>
                                            </div>
                                        </div>
                                        <div class="span4">
                                            <div class="ba-store-statistic-total-price">
                                                <span class="ba-store-statistic-title">Total</span>
                                                <span class="ba-store-statistic-price">0.00 €</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid ba-store-statistic-body-wrapper">
                                        <div class="span8 ba-statistics-chart-wrapper">
                                            <span></span>
                                            <div class="ba-statistics-chart ba-chart-single-point ba-chart-loaded"><svg style="width: 764px; height: 420px;"><g><text x="45" y="356" text-anchor="end" alignment-baseline="middle">0</text><text x="45" y="281" text-anchor="end" alignment-baseline="middle">100</text><text x="45" y="206" text-anchor="end" alignment-baseline="middle">200</text><text x="45" y="130" text-anchor="end" alignment-baseline="middle">300</text><text x="45" y="55" text-anchor="end" alignment-baseline="middle">400</text></g><g><text x="402" y="372" text-anchor="middle" alignment-baseline="hanging">Dec 16, 2021</text></g><path d=""></path><g class="ba-chart-points-wrapper"><circle cx="402.115234375" cy="356"></circle><rect x="375.05078125" y="310" width="54.12890625" height="34"></rect><text x="402" y="332" text-anchor="middle" alignment-baseline="baseline">0.00 €</text></g></svg></div>
                                        </div>
                                        <div class="span4 ba-store-statistic-products-wrapper">
                                            <span class="ba-store-statistic-products-title">Top 10</span>
                                            <div class="ba-store-statistic-products"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row-fluid">
                           <div class="span8 last-edit-pages">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>
                                                <span>
                                                    Recently Opened                                                </span>
                                            </th>
                                            <th>
                                                <span>
                                                    Views                                                </span>
                                            </th>
                                            <th>
                                                <span>
                                                    ID                                                </span>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="title-cell">
                                                <a target="_blank" href="index.php?option=com_gridbox&amp;task=gridbox.edit&amp;id=43">
                                                    <span class="post-intro-image" style="background-image: url(https://www.balbooa.com/demo-admin/images/products/51.jpg);"></span>                                                    V-Neck Playsuit                                                </a>
                                            </td>
                                            <td class="hits-cell">
                                                23                                            </td>
                                            <td>
                                                43                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title-cell">
                                                <a target="_blank" href="index.php?option=com_gridbox&amp;task=gridbox.edit&amp;id=40">
                                                    <span class="post-intro-image" style="background-image: url(https://www.balbooa.com/demo-admin/images/products/21.jpg);"></span>                                                    Gathered Sleeve Jacket                                                </a>
                                            </td>
                                            <td class="hits-cell">
                                                26                                            </td>
                                            <td>
                                                40                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title-cell">
                                                <a target="_blank" href="index.php?option=com_gridbox&amp;task=gridbox.edit&amp;id=39">
                                                    <span class="post-intro-image" style="background-image: url(https://www.balbooa.com/demo-admin/images/products/11.jpg);"></span>                                                    Long cardigan                                                </a>
                                            </td>
                                            <td class="hits-cell">
                                                32                                            </td>
                                            <td>
                                                39                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title-cell">
                                                <a target="_blank" href="index.php?option=com_gridbox&amp;task=gridbox.edit&amp;id=44">
                                                    <span class="post-intro-image" style="background-image: url(https://www.balbooa.com/demo-admin/images/products/61.jpg);"></span>                                                    Cropped Cardigan                                                </a>
                                            </td>
                                            <td class="hits-cell">
                                                51                                            </td>
                                            <td>
                                                44                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title-cell">
                                                <a target="_blank" href="index.php?option=com_gridbox&amp;task=gridbox.edit&amp;id=41">
                                                    <span class="post-intro-image" style="background-image: url(https://www.balbooa.com/demo-admin/images/products/31.jpg);"></span>                                                    Cigarette Trousers                                                </a>
                                            </td>
                                            <td class="hits-cell">
                                                55                                            </td>
                                            <td>
                                                41                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title-cell">
                                                <a target="_blank" href="index.php?option=com_gridbox&amp;task=gridbox.edit&amp;id=36">
                                                    <span class="post-intro-image" style="background-image: url(https://www.balbooa.com/demo-admin/images/hotel-rooms/hr-8.jpg);"></span>                                                    Studio Large                                                </a>
                                            </td>
                                            <td class="hits-cell">
                                                214                                            </td>
                                            <td>
                                                36                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title-cell">
                                                <a target="_blank" href="index.php?option=com_gridbox&amp;task=gridbox.edit&amp;id=21">
                                                    <span class="post-intro-image" style="background-image: url(https://www.balbooa.com/demo-admin/images/demo-admin/blog-post-2.jpg);"></span>                                                    Why Buying a Big House is a Bad Investment                                                </a>
                                            </td>
                                            <td class="hits-cell">
                                                692                                            </td>
                                            <td>
                                                21                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title-cell">
                                                <a target="_blank" href="index.php?option=com_gridbox&amp;task=gridbox.edit&amp;id=24">
                                                    <span class="post-intro-image" style="background-image: url(https://www.balbooa.com/demo-admin/images/demo-admin/cover-1920x1280.jpg);"></span>                                                    How to Choose a Hostel Bed Like a Pro                                                </a>
                                            </td>
                                            <td class="hits-cell">
                                                99                                            </td>
                                            <td>
                                                24                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title-cell">
                                                <a target="_blank" href="index.php?option=com_gridbox&amp;task=gridbox.edit&amp;id=20">
                                                    <span class="post-intro-image" style="background-image: url(https://www.balbooa.com/demo-admin/images/demo-admin/blog-post-1.jpg);"></span>                                                    Introducing The New Enside Culture Manual                                                </a>
                                            </td>
                                            <td class="hits-cell">
                                                1758                                            </td>
                                            <td>
                                                20                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title-cell">
                                                <a target="_blank" href="index.php?option=com_gridbox&amp;task=gridbox.edit&amp;id=23">
                                                    <span class="post-intro-image" style="background-image: url(https://www.balbooa.com/demo-admin/images/demo-admin/blog-post-4.jpg);"></span>                                                    Making Your Instagram Account Private                                                </a>
                                            </td>
                                            <td class="hits-cell">
                                                126                                            </td>
                                            <td>
                                                23                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="span4 recent-gridbox-apps">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>
                                                <span>
                                                    Apps                                                </span>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <a href="index.php?option=com_gridbox&amp;view=pages">
                                                    <span class="post-intro-image gridbox-app-item-single">
                                                        <i class="zmdi zmdi-file"></i>
                                                    </span>
                                                    <span class="recent-apps-title">
                                                        Pages                                                    </span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="index.php?option=com_gridbox&amp;view=apps&amp;id=3">
                                                    <span class="post-intro-image gridbox-app-item-blog">
                                                        <i class="zmdi zmdi-format-color-text"></i>
                                                    </span>
                                                    <span class="recent-apps-title">
                                                        Blog                                                    </span>
                                            </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="index.php?option=com_gridbox&amp;view=apps&amp;id=14">
                                                    <span class="post-intro-image gridbox-app-item-blank">
                                                        <i class="zmdi zmdi-crop-free"></i>
                                                    </span>
                                                    <span class="recent-apps-title">
                                                        Zero App                                                    </span>
                                            </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="index.php?option=com_gridbox&amp;view=apps&amp;id=15">
                                                    <span class="post-intro-image gridbox-app-item-portfolio">
                                                        <i class="zmdi zmdi-camera"></i>
                                                    </span>
                                                    <span class="recent-apps-title">
                                                        Portfolio                                                    </span>
                                            </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="index.php?option=com_gridbox&amp;view=apps&amp;id=16">
                                                    <span class="post-intro-image gridbox-app-item-hotel-rooms">
                                                        <i class="zmdi zmdi-hotel"></i>
                                                    </span>
                                                    <span class="recent-apps-title">
                                                        Hotel Rooms                                                    </span>
                                            </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="index.php?option=com_gridbox&amp;view=apps&amp;id=17">
                                                    <span class="post-intro-image gridbox-app-item-products">
                                                        <i class="zmdi zmdi-shopping-basket"></i>
                                                    </span>
                                                    <span class="recent-apps-title">
                                                        Products                                                    </span>
                                            </a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="gridbox-app-item-footer">
                                    <a href="index.php?option=com_gridbox&amp;view=appslist">
                                       <i class="zmdi zmdi-widgets"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="row-fluid">
                            <div class="span4 recent-gridbox-files">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th colspan="2">
                                                <span>
                                                    Recent Files                                                </span>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="title-td">
                                                <span class="recent-file-image" style="background-image: url(https://www.balbooa.com/demo-admin/administrator/index.php?option=com_gridbox&amp;task=uploader.showImage&amp;image=/compressed/tablet-portrait/hotel-rooms/hr-4.webp&amp;time=1639639200);"></span>
                                                <span class="file-title">
                                                    hr-4.webp                                                </span>
                                            </td>
                                            <td class="filesize-td">
                                                <span>
                                                    18 KB                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title-td">
                                                <span class="recent-file-image" style="background-image: url(https://www.balbooa.com/demo-admin/administrator/index.php?option=com_gridbox&amp;task=uploader.showImage&amp;image=/compressed/tablet-portrait/hotel-rooms/hr-5.webp&amp;time=1639639200);"></span>
                                                <span class="file-title">
                                                    hr-5.webp                                                </span>
                                            </td>
                                            <td class="filesize-td">
                                                <span>
                                                    13 KB                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title-td">
                                                <span class="recent-file-image" style="background-image: url(https://www.balbooa.com/demo-admin/administrator/index.php?option=com_gridbox&amp;task=uploader.showImage&amp;image=/compressed/tablet-portrait/hotel-rooms/hr-2.webp&amp;time=1639639200);"></span>
                                                <span class="file-title">
                                                    hr-2.webp                                                </span>
                                            </td>
                                            <td class="filesize-td">
                                                <span>
                                                    12 KB                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title-td">
                                                <span class="recent-file-image" style="background-image: url(https://www.balbooa.com/demo-admin/administrator/index.php?option=com_gridbox&amp;task=uploader.showImage&amp;image=/compressed/laptop/hotel-rooms/hr-2.webp&amp;time=1639639200);"></span>
                                                <span class="file-title">
                                                    hr-2.webp                                                </span>
                                            </td>
                                            <td class="filesize-td">
                                                <span>
                                                    25 KB                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title-td">
                                                <span class="recent-file-image" style="background-image: url(https://www.balbooa.com/demo-admin/administrator/index.php?option=com_gridbox&amp;task=uploader.showImage&amp;image=/compressed/laptop/hotel-rooms/hr-4.webp&amp;time=1639639200);"></span>
                                                <span class="file-title">
                                                    hr-4.webp                                                </span>
                                            </td>
                                            <td class="filesize-td">
                                                <span>
                                                    38 KB                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title-td">
                                                <span class="recent-file-image" style="background-image: url(https://www.balbooa.com/demo-admin/administrator/index.php?option=com_gridbox&amp;task=uploader.showImage&amp;image=/compressed/laptop/hotel-rooms/hr-5.webp&amp;time=1639639200);"></span>
                                                <span class="file-title">
                                                    hr-5.webp                                                </span>
                                            </td>
                                            <td class="filesize-td">
                                                <span>
                                                    27 KB                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title-td">
                                                <span class="recent-file-image" style="background-image: url(https://www.balbooa.com/demo-admin/administrator/index.php?option=com_gridbox&amp;task=uploader.showImage&amp;image=/compressed/tablet/hotel-rooms/hr-2.webp&amp;time=1639639200);"></span>
                                                <span class="file-title">
                                                    hr-2.webp                                                </span>
                                            </td>
                                            <td class="filesize-td">
                                                <span>
                                                    20 KB                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title-td">
                                                <span class="recent-file-image" style="background-image: url(https://www.balbooa.com/demo-admin/administrator/index.php?option=com_gridbox&amp;task=uploader.showImage&amp;image=/compressed/tablet/hotel-rooms/hr-5.webp&amp;time=1639639200);"></span>
                                                <span class="file-title">
                                                    hr-5.webp                                                </span>
                                            </td>
                                            <td class="filesize-td">
                                                <span>
                                                    21 KB                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title-td">
                                                <span class="recent-file-image" style="background-image: url(https://www.balbooa.com/demo-admin/administrator/index.php?option=com_gridbox&amp;task=uploader.showImage&amp;image=/compressed/tablet/hotel-rooms/hr-4.webp&amp;time=1639639200);"></span>
                                                <span class="file-title">
                                                    hr-4.webp                                                </span>
                                            </td>
                                            <td class="filesize-td">
                                                <span>
                                                    29 KB                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title-td">
                                                <span class="recent-file-image" style="background-image: url(https://www.balbooa.com/demo-admin/administrator/index.php?option=com_gridbox&amp;task=uploader.showImage&amp;image=/compressed/phone-portrait/hotel-rooms/hr-2.webp&amp;time=1639639200);"></span>
                                                <span class="file-title">
                                                    hr-2.webp                                                </span>
                                            </td>
                                            <td class="filesize-td">
                                                <span>
                                                    4 KB                                                </span>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="gridbox-app-item-footer">
                                    <a href="#" class="dashboard-view-media-manager">
                                       <i class="zmdi zmdi-folder"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="span4 recent-gridbox-comments">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>
                                                <span>
                                                    Recent Comments                                                </span>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="name-cell">
                                                <span class="comments-text-wrapper">
                                                    <span class="ba-author-avatar" style="background-image: url(https://www.balbooa.com/demo-admin/images/demo-admin/c5.jpg);"></span>
                                                    <img src="https://www.balbooa.com/demo-admin/images/demo-admin/c5.jpg" style="display: none !important;" onerror="setGravatarDefault(this);">
                                                    <span class="comments-text">
                                                        <span class="comments-name-wrapper">
                                                            <span class="comments-name">Tommy Mullins</span>
                                                            <span class="comments-date">2019-05-30</span>
                                                        </span>
                                                        <span class="comments-message">My 32 year old son rates this colour palette very alluring 😍</span>
                                                    </span>
                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="name-cell">
                                                <span class="comments-text-wrapper">
                                                    <span class="ba-author-avatar" style="background-image: url(https://www.balbooa.com/demo-admin/images/demo-admin/c4.jpg);"></span>
                                                    <img src="https://www.balbooa.com/demo-admin/images/demo-admin/c4.jpg" style="display: none !important;" onerror="setGravatarDefault(this);">
                                                    <span class="comments-text">
                                                        <span class="comments-name-wrapper">
                                                            <span class="comments-name">Sebastien Whittaker</span>
                                                            <span class="comments-date">2019-05-30</span>
                                                        </span>
                                                        <span class="comments-message">Elegant dude I love the use of avatar and layout!</span>
                                                    </span>
                                                </span>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="gridbox-app-item-footer">
                                    <a href="index.php?option=com_gridbox&amp;view=comments">
                                       <i class="zmdi zmdi-comment-more"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="span4 recent-gridbox-reviews">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>
                                                <span>
                                                    Recent Reviews                                                </span>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="name-cell">
                                                <span class="comments-text-wrapper">
                                                    <span class="ba-author-avatar" style="background-image: url(https://www.gravatar.com/avatar/1e6e0982c3fd69a61c3f06091d61858b?d=https://www.balbooa.com/demo-admin/components/com_gridbox/assets/images/default-user.png&amp;s=50);"></span>
                                                    <img src="https://www.gravatar.com/avatar/1e6e0982c3fd69a61c3f06091d61858b?d=https://www.balbooa.com/demo-admin/components/com_gridbox/assets/images/default-user.png&amp;s=50" style="display: none !important;" onerror="setGravatarDefault(this);">
                                                    <span class="comments-text">
                                                        <span class="comments-name-wrapper">
                                                            <span class="comments-name">
                                                                <span>Ellisha Sanford</span>
                                                                <span class="review-rating-wrapper">
                                                            <i class="zmdi zmdi-star active"></i>
                                                            <i class="zmdi zmdi-star active"></i>
                                                            <i class="zmdi zmdi-star active"></i>
                                                            <i class="zmdi zmdi-star active"></i>
                                                            <i class="zmdi zmdi-star active"></i>
                                                                </span>
                                                            </span>
                                                        </span>
                                                        <span class="comments-message">There is nothing I can say that hasn't been said already. It is really an experience of a life time. Being so close to nature in the open air is a wonderful change from the hustle and bustle of the city. You are also like a 10min walk to some restaurants and grocery store. Would gladly stay here again. It's a beautiful place to reconnect with yourself.</span>
                                                    </span>
                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="name-cell">
                                                <span class="comments-text-wrapper">
                                                    <span class="ba-author-avatar" style="background-image: url(https://www.gravatar.com/avatar/456b702febf89b2653206536a43eaa85?d=https://www.balbooa.com/demo-admin/components/com_gridbox/assets/images/default-user.png&amp;s=50);"></span>
                                                    <img src="https://www.gravatar.com/avatar/456b702febf89b2653206536a43eaa85?d=https://www.balbooa.com/demo-admin/components/com_gridbox/assets/images/default-user.png&amp;s=50" style="display: none !important;" onerror="setGravatarDefault(this);">
                                                    <span class="comments-text">
                                                        <span class="comments-name-wrapper">
                                                            <span class="comments-name">
                                                                <span>Nicolle Odom</span>
                                                                <span class="review-rating-wrapper">
                                                            <i class="zmdi zmdi-star active"></i>
                                                            <i class="zmdi zmdi-star active"></i>
                                                            <i class="zmdi zmdi-star active"></i>
                                                            <i class="zmdi zmdi-star active"></i>
                                                            <i class="zmdi zmdi-star active"></i>
                                                                </span>
                                                            </span>
                                                        </span>
                                                        <span class="comments-message">We loved every single moment of our time here, and didn’t want to leave. We walked away with so much joy in our hearts and a sense of calm we haven’t felt in a long time, living in an especially hectic city. Most importantly, perhaps, is the deep sense of gratitude we felt, both for being able to experience this exceptional place as well as for everything nature makes possible. We are forever grateful, and will forever remember your wise words about always having an “escape” in life to rest and truly relax.</span>
                                                    </span>
                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="name-cell">
                                                <span class="comments-text-wrapper">
                                                    <span class="ba-author-avatar" style="background-image: url(https://www.gravatar.com/avatar/ffd74f686fc5bfb87fe041ab2a922f7a?d=https://www.balbooa.com/demo-admin/components/com_gridbox/assets/images/default-user.png&amp;s=50);"></span>
                                                    <img src="https://www.gravatar.com/avatar/ffd74f686fc5bfb87fe041ab2a922f7a?d=https://www.balbooa.com/demo-admin/components/com_gridbox/assets/images/default-user.png&amp;s=50" style="display: none !important;" onerror="setGravatarDefault(this);">
                                                    <span class="comments-text">
                                                        <span class="comments-name-wrapper">
                                                            <span class="comments-name">
                                                                <span>Darrel Gallagher</span>
                                                                <span class="review-rating-wrapper">
                                                            <i class="zmdi zmdi-star active"></i>
                                                            <i class="zmdi zmdi-star active"></i>
                                                            <i class="zmdi zmdi-star active"></i>
                                                            <i class="zmdi zmdi-star"></i>
                                                            <i class="zmdi zmdi-star"></i>
                                                                </span>
                                                            </span>
                                                        </span>
                                                        <span class="comments-message">Great location and super clean, but noisy neighbors.</span>
                                                    </span>
                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="name-cell">
                                                <span class="comments-text-wrapper">
                                                    <span class="ba-author-avatar" style="background-image: url(https://www.gravatar.com/avatar/456b702febf89b2653206536a43eaa85?d=https://www.balbooa.com/demo-admin/components/com_gridbox/assets/images/default-user.png&amp;s=50);"></span>
                                                    <img src="https://www.gravatar.com/avatar/456b702febf89b2653206536a43eaa85?d=https://www.balbooa.com/demo-admin/components/com_gridbox/assets/images/default-user.png&amp;s=50" style="display: none !important;" onerror="setGravatarDefault(this);">
                                                    <span class="comments-text">
                                                        <span class="comments-name-wrapper">
                                                            <span class="comments-name">
                                                                <span>Nicolle Odom</span>
                                                                <span class="review-rating-wrapper">
                                                            <i class="zmdi zmdi-star active"></i>
                                                            <i class="zmdi zmdi-star active"></i>
                                                            <i class="zmdi zmdi-star active"></i>
                                                            <i class="zmdi zmdi-star active"></i>
                                                            <i class="zmdi zmdi-star"></i>
                                                                </span>
                                                            </span>
                                                        </span>
                                                        <span class="comments-message">Good location for quick stay and access to local eateries.</span>
                                                    </span>
                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="name-cell">
                                                <span class="comments-text-wrapper">
                                                    <span class="ba-author-avatar" style="background-image: url(https://www.gravatar.com/avatar/1e6e0982c3fd69a61c3f06091d61858b?d=https://www.balbooa.com/demo-admin/components/com_gridbox/assets/images/default-user.png&amp;s=50);"></span>
                                                    <img src="https://www.gravatar.com/avatar/1e6e0982c3fd69a61c3f06091d61858b?d=https://www.balbooa.com/demo-admin/components/com_gridbox/assets/images/default-user.png&amp;s=50" style="display: none !important;" onerror="setGravatarDefault(this);">
                                                    <span class="comments-text">
                                                        <span class="comments-name-wrapper">
                                                            <span class="comments-name">
                                                                <span>Ellisha Sanford</span>
                                                                <span class="review-rating-wrapper">
                                                            <i class="zmdi zmdi-star active"></i>
                                                            <i class="zmdi zmdi-star"></i>
                                                            <i class="zmdi zmdi-star"></i>
                                                            <i class="zmdi zmdi-star"></i>
                                                            <i class="zmdi zmdi-star"></i>
                                                                </span>
                                                            </span>
                                                        </span>
                                                        <span class="comments-message">It's not clean enough. It was amazingly cold</span>
                                                    </span>
                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="name-cell">
                                                <span class="comments-text-wrapper">
                                                    <span class="ba-author-avatar" style="background-image: url(https://www.gravatar.com/avatar/456b702febf89b2653206536a43eaa85?d=https://www.balbooa.com/demo-admin/components/com_gridbox/assets/images/default-user.png&amp;s=50);"></span>
                                                    <img src="https://www.gravatar.com/avatar/456b702febf89b2653206536a43eaa85?d=https://www.balbooa.com/demo-admin/components/com_gridbox/assets/images/default-user.png&amp;s=50" style="display: none !important;" onerror="setGravatarDefault(this);">
                                                    <span class="comments-text">
                                                        <span class="comments-name-wrapper">
                                                            <span class="comments-name">
                                                                <span>Nicolle Odom</span>
                                                                <span class="review-rating-wrapper">
                                                            <i class="zmdi zmdi-star active"></i>
                                                            <i class="zmdi zmdi-star active"></i>
                                                            <i class="zmdi zmdi-star active"></i>
                                                            <i class="zmdi zmdi-star active"></i>
                                                            <i class="zmdi zmdi-star"></i>
                                                                </span>
                                                            </span>
                                                        </span>
                                                        <span class="comments-message">Nice place and a great value.</span>
                                                    </span>
                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="name-cell">
                                                <span class="comments-text-wrapper">
                                                    <span class="ba-author-avatar" style="background-image: url(https://www.gravatar.com/avatar/ffd74f686fc5bfb87fe041ab2a922f7a?d=https://www.balbooa.com/demo-admin/components/com_gridbox/assets/images/default-user.png&amp;s=50);"></span>
                                                    <img src="https://www.gravatar.com/avatar/ffd74f686fc5bfb87fe041ab2a922f7a?d=https://www.balbooa.com/demo-admin/components/com_gridbox/assets/images/default-user.png&amp;s=50" style="display: none !important;" onerror="setGravatarDefault(this);">
                                                    <span class="comments-text">
                                                        <span class="comments-name-wrapper">
                                                            <span class="comments-name">
                                                                <span>Darrel Gallagher</span>
                                                                <span class="review-rating-wrapper">
                                                            <i class="zmdi zmdi-star active"></i>
                                                            <i class="zmdi zmdi-star active"></i>
                                                            <i class="zmdi zmdi-star active"></i>
                                                            <i class="zmdi zmdi-star active"></i>
                                                            <i class="zmdi zmdi-star"></i>
                                                                </span>
                                                            </span>
                                                        </span>
                                                        <span class="comments-message">What an amazing spot for a romantic weekend getaway. We spent a lazy weekend here doing nothing but enjoying the view and the treehouse. 100% recommend.</span>
                                                    </span>
                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="name-cell">
                                                <span class="comments-text-wrapper">
                                                    <span class="ba-author-avatar" style="background-image: url(https://www.gravatar.com/avatar/1e6e0982c3fd69a61c3f06091d61858b?d=https://www.balbooa.com/demo-admin/components/com_gridbox/assets/images/default-user.png&amp;s=50);"></span>
                                                    <img src="https://www.gravatar.com/avatar/1e6e0982c3fd69a61c3f06091d61858b?d=https://www.balbooa.com/demo-admin/components/com_gridbox/assets/images/default-user.png&amp;s=50" style="display: none !important;" onerror="setGravatarDefault(this);">
                                                    <span class="comments-text">
                                                        <span class="comments-name-wrapper">
                                                            <span class="comments-name">
                                                                <span>Ellisha Sanford</span>
                                                                <span class="review-rating-wrapper">
                                                            <i class="zmdi zmdi-star active"></i>
                                                            <i class="zmdi zmdi-star active"></i>
                                                            <i class="zmdi zmdi-star active"></i>
                                                            <i class="zmdi zmdi-star active"></i>
                                                            <i class="zmdi zmdi-star"></i>
                                                                </span>
                                                            </span>
                                                        </span>
                                                        <span class="comments-message">Nice location and quick walk to most things. We enjoyed the space.</span>
                                                    </span>
                                                </span>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="gridbox-app-item-footer">
                                    <a href="index.php?option=com_gridbox&amp;view=reviews">
                                       <i class="zmdi zmdi-ticket-star"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<div class="ba-dashboard-apps-dialog ba-dashboard-apps-list">
    <div class="ba-dashboard-apps-body">
        <div class="ba-gridbox-dashboard-row">
            <a href="https://www.balbooa.com/demo-admin/index.php?option=com_gridbox&amp;view=editor&amp;tmpl=component&amp;name=demo&amp;pwd=%242y%2410%24qAhmCj.D5ceMHhCL0kwq1.dXACYsK6SL%2FnmsaCtHVnhjZfNkqLBGa&amp;app_id=0&amp;id=" target="_blank" class="gridbox-app-item-single">
                <i class="zmdi zmdi-file"></i>
                <span>Pages</span>
            </a>
        </div>
        <div class="ba-gridbox-dashboard-row">
            <a href="https://www.balbooa.com/demo-admin/index.php?option=com_gridbox&amp;view=editor&amp;tmpl=component&amp;name=demo&amp;pwd=%242y%2410%24qAhmCj.D5ceMHhCL0kwq1.dXACYsK6SL%2FnmsaCtHVnhjZfNkqLBGa&amp;app_id=3&amp;id=" target="_blank" class="gridbox-app-item-blog">
                <i class="zmdi zmdi-format-color-text"></i>
                <span>Blog</span>
            </a>
        </div>
        <div class="ba-gridbox-dashboard-row">
            <a href="https://www.balbooa.com/demo-admin/index.php?option=com_gridbox&amp;view=editor&amp;tmpl=component&amp;name=demo&amp;pwd=%242y%2410%24qAhmCj.D5ceMHhCL0kwq1.dXACYsK6SL%2FnmsaCtHVnhjZfNkqLBGa&amp;app_id=14&amp;id=" target="_blank" class="gridbox-app-item-blank">
                <i class="zmdi zmdi-crop-free"></i>
                <span>Zero App</span>
            </a>
        </div>
        <div class="ba-gridbox-dashboard-row">
            <a href="https://www.balbooa.com/demo-admin/index.php?option=com_gridbox&amp;view=editor&amp;tmpl=component&amp;name=demo&amp;pwd=%242y%2410%24qAhmCj.D5ceMHhCL0kwq1.dXACYsK6SL%2FnmsaCtHVnhjZfNkqLBGa&amp;app_id=15&amp;id=" target="_blank" class="gridbox-app-item-portfolio">
                <i class="zmdi zmdi-camera"></i>
                <span>Portfolio</span>
            </a>
        </div>
        <div class="ba-gridbox-dashboard-row">
            <a href="https://www.balbooa.com/demo-admin/index.php?option=com_gridbox&amp;view=editor&amp;tmpl=component&amp;name=demo&amp;pwd=%242y%2410%24qAhmCj.D5ceMHhCL0kwq1.dXACYsK6SL%2FnmsaCtHVnhjZfNkqLBGa&amp;app_id=16&amp;id=" target="_blank" class="gridbox-app-item-hotel-rooms">
                <i class="zmdi zmdi-hotel"></i>
                <span>Hotel Rooms</span>
            </a>
        </div>
        <div class="ba-gridbox-dashboard-row">
            <a href="https://www.balbooa.com/demo-admin/index.php?option=com_gridbox&amp;view=editor&amp;tmpl=component&amp;name=demo&amp;pwd=%242y%2410%24qAhmCj.D5ceMHhCL0kwq1.dXACYsK6SL%2FnmsaCtHVnhjZfNkqLBGa&amp;app_id=17&amp;id=" target="_blank" class="gridbox-app-item-products">
                <i class="zmdi zmdi-shopping-basket"></i>
                <span>Products</span>
            </a>
        </div>
    </div>
</div>
<div class="ba-dashboard-apps-dialog ba-dashboard-about">
    <div class="ba-dashboard-apps-body">
        <div class="ba-gridbox-dashboard-row gridbox-version-wrapper">
            <i class="zmdi zmdi-info"></i>
            <span>Gridbox</span>
            <span class="gridbox-version">2.12.6</span>
        </div>
        <div class="ba-gridbox-dashboard-row gridbox-app-item-blog gridbox-deactivate-license">
            <i class="zmdi zmdi-shield-check"></i>
            <span>Your license is active</span>
            <a class="deactivate-link dashboard-link-action" href="#">Deactivate</a>
        </div>
        <div class="ba-gridbox-dashboard-row gridbox-app-item-blog gridbox-activate-license" style="display:none;">
            <i class="zmdi zmdi-shield-check"></i>
            <span>Activate license</span>
            <a class="activate-link dashboard-link-action" href="#">Activate</a>
        </div>
        <div class="ba-gridbox-dashboard-row gridbox-app-item-blog gridbox-update-wrapper">
            <i class="zmdi zmdi-check-circle"></i>
            <span>Gridbox is up to date</span>
        </div>
    </div>
    <div class="ba-dashboard-apps-footer">
        <span>© 2021 <a href="https://www.balbooa.com/" target="_blink">Balbooa.com</a> All Rights Reserved.</span>
    </div>
</div>
<div id="deactivate-dialog" class="ba-modal-sm modal hide" style="display:none">
    <div class="modal-body">
        <h3>License Deactivation</h3>
        <p class="modal-text can-delete">Are you sure you want to deactivate the license? The site will no longer receive updates.</p>
    </div>
    <div class="modal-footer">
        <a href="#" class="ba-btn" data-dismiss="modal">
            Cancel        </a>
        <a href="#" class="ba-btn-primary red-btn" id="apply-deactivate">
            Apply        </a>
    </div>
</div>
<template class="ba-store-statistic-product-template">
    <div class="ba-store-statistic-product">
        <div class="ba-store-statistic-product-image"></div>
        <div class="ba-store-statistic-product-content">
            <span class="ba-store-statistic-product-title-wrapper">
                <span class="ba-store-statistic-product-title"></span>
                <span class="ba-store-statistic-product-description">
                    <span class="ba-store-statistic-product-info">
                        
                    </span>
                </span>
            </span>
            <span class="ba-store-statistic-product-sales-wrapper">
                <span class="ba-store-statistic-product-sales">
                    <span class="ba-store-statistic-product-sales-count"></span>
                    <span class="ba-store-statistic-product-sales-text">Sales</span>
                </span>
                <span class="ba-store-statistic-price"></span>
            </span>
        </div>
        <a href="" target="_blank"></a>
    </div>    
</template>

<div class="ba-context-menu options-context-menu" data-source="gridbox-options" style="left: 347px; --context-top:586px; display: none;">
    <span class="export-gridbox">
        <i class="zmdi zmdi-download "></i>
        <span class="ba-context-menu-title">
            Export        </span>
    </span>
    <span class="import-gridbox">
        <i class="zmdi zmdi-upload"></i>
        <span class="ba-context-menu-title">
            Import        </span>
    </span>
    <span class="import-joomla-content">
        <i class="zmdi zmdi-inbox"></i>
        <span class="ba-context-menu-title">
            Import Joomla Content        </span>
    </span>
    <span class="context-menu-item-link ba-group-element">
        <a href="index.php?option=com_config&amp;view=component&amp;component=com_gridbox&amp;path=" class="default-action">
            <i class="zmdi zmdi-accounts"></i>
            <span class="ba-context-menu-title">
                Permissions            </span>
        </a>
    </span>
</div>
<div class="ba-context-menu store-context-menu" data-source="gridbox-store" style="left: 347px; --context-top:249px; display: none;">
    <span class="context-menu-item-link">
        <a href="index.php?option=com_gridbox&amp;view=orders" class="default-action">
            <i class="zmdi zmdi-shopping-cart"></i>
            <span class="ba-context-menu-title">
                Orders            </span>
            
        </a>
    </span>
    <span class="context-menu-item-link">
        <a href="index.php?option=com_gridbox&amp;view=paymentmethods" class="default-action">
            <i class="zmdi zmdi-card"></i>
            <span class="ba-context-menu-title">
                Payment Methods            </span>
        </a>
    </span>
    <span class="context-menu-item-link">
        <a href="index.php?option=com_gridbox&amp;view=shipping" class="default-action">
            <i class="zmdi zmdi-truck"></i>
            <span class="ba-context-menu-title">
                Shipping            </span>
        </a>
    </span>
    <span class="context-menu-item-link">
        <a href="index.php?option=com_gridbox&amp;view=promocodes" class="default-action">
            <i class="zmdi zmdi-card-giftcard"></i>
            <span class="ba-context-menu-title">
                Promo Codes            </span>
        </a>
    </span>
    <span class="context-menu-item-link">
        <a href="index.php?option=com_gridbox&amp;view=sales" class="default-action">
            <i class="zmdi zmdi-bookmark"></i>
            <span class="ba-context-menu-title">
                Discounts            </span>
        </a>
    </span>
    <span class="context-menu-item-link">
        <a href="index.php?option=com_gridbox&amp;view=productoptions" class="default-action">
            <i class="zmdi zmdi-invert-colors"></i>
            <span class="ba-context-menu-title">
                Product Options            </span>
        </a>
    </span>
    <span class="context-menu-item-link ba-group-element">
        <a href="index.php?option=com_gridbox&amp;view=storesettings" class="default-action">
            <i class="zmdi zmdi-settings"></i>
            <span class="ba-context-menu-title">
                Settings            </span>
        </a>
    </span>
</div>
<div id="languages-dialog" class="ba-modal-sm modal hide" style="display:none">
    <div class="modal-body">
        <div class="languages-wrapper">

        <div class="language-line"><span class="language-img"><img src="https://www.balbooa.com/updates/gridbox/language/flags/ca-ES.svg"></span><span class="language-title" data-key="0">Catalan</span><span class="language-code">ca-ES</span></div><div class="language-line"><span class="language-img"><img src="https://www.balbooa.com/updates/gridbox/language/flags/zh-CN.svg"></span><span class="language-title" data-key="1">Chinese Simplified</span><span class="language-code">zh-CN</span></div><div class="language-line"><span class="language-img"><img src="https://www.balbooa.com/updates/gridbox/language/flags/cs-CZ.svg"></span><span class="language-title" data-key="2">Czech</span><span class="language-code">cs-CZ</span></div><div class="language-line"><span class="language-img"><img src="https://www.balbooa.com/updates/gridbox/language/flags/nl-NL.svg"></span><span class="language-title" data-key="3">Dutch</span><span class="language-code">nl-NL</span></div><div class="language-line"><span class="language-img"><img src="https://www.balbooa.com/updates/gridbox/language/flags/fr-FR.svg"></span><span class="language-title" data-key="4">French</span><span class="language-code">fr-FR</span></div><div class="language-line"><span class="language-img"><img src="https://www.balbooa.com/updates/gridbox/language/flags/de-DE.svg"></span><span class="language-title" data-key="5">German</span><span class="language-code">de-DE</span></div><div class="language-line"><span class="language-img"><img src="https://www.balbooa.com/updates/gridbox/language/flags/hu-HU.svg"></span><span class="language-title" data-key="6">Hungarian</span><span class="language-code">hu-HU</span></div><div class="language-line"><span class="language-img"><img src="https://www.balbooa.com/updates/gridbox/language/flags/it-IT.svg"></span><span class="language-title" data-key="7">Italian</span><span class="language-code">it-IT</span></div><div class="language-line"><span class="language-img"><img src="https://www.balbooa.com/updates/gridbox/language/flags/pl-PL.svg"></span><span class="language-title" data-key="8">Polish</span><span class="language-code">pl-PL</span></div><div class="language-line"><span class="language-img"><img src="https://www.balbooa.com/updates/gridbox/language/flags/pt-BR.svg"></span><span class="language-title" data-key="9">Portuguese Brazil</span><span class="language-code">pt-BR</span></div><div class="language-line"><span class="language-img"><img src="https://www.balbooa.com/updates/gridbox/language/flags/ru-RU.svg"></span><span class="language-title" data-key="10">Russian</span><span class="language-code">ru-RU</span></div><div class="language-line"><span class="language-img"><img src="https://www.balbooa.com/updates/gridbox/language/flags/es-ES.svg"></span><span class="language-title" data-key="11">Spanish</span><span class="language-code">es-ES</span></div></div>
    </div>
</div>
<div id="import-joomla-content-modal" class="ba-modal-md modal hide" style="display:none">
    <div class="modal-body">
        <div class="ba-modal-header">
            <h3>Select an app to import articles</h3>
            <i data-dismiss="modal" class="zmdi zmdi-close"></i>
        </div>
        <div class="availible-folders">
            <ul class="root-list">
                
            </ul>
        </div>
    </div>
    <div class="modal-footer">
        <a href="#" class="ba-btn" data-dismiss="modal">
            Cancel        </a>
        
    </div>
</div>
<div id="import-dialog" class="ba-modal-sm modal hide" style="display:none">
    <div class="modal-header">
        <h3>Import</h3>
        <label class="ba-help-icon">
            <i class="zmdi zmdi-help"></i>
            <span class="ba-tooltip ba-help ba-hide-element">
                Import a previously exported Gridbox Pages and Themes. Select .xml file to import. 
            </span>
        </label>
    </div>
    <div class="modal-body">
        <div class="ba-input-lg">
            <input id="theme-import-trigger" class="theme-import-trigger" readonly="" type="text" placeholder="Select">
            <i class="zmdi zmdi-attachment-alt theme-import-trigger"></i>
            
        </div>
    </div>
    <div class="modal-footer">
        <a href="#" class="ba-btn" data-dismiss="modal">
            Cancel        </a>
        <a href="#" class="ba-btn-primary apply-import">
            Install        </a>
    </div>
</div>
<input type="hidden" id="installing-const" value="Installing. Please wait..."><div id="photo-editor-dialog" class="ba-modal-lg modal hide" style="display:none">
    <div class="modal-header">
        <span class="ba-dialog-title">Photo Editor</span>
        <div class="modal-header-icon">
            <i class="zmdi zmdi-close" data-dismiss="modal"></i>
        </div>
    </div>
    <div class="modal-body">
        <div class="general-tabs">
            <ul class="nav nav-tabs uploader-nav">
                <li class="active">
                    <a href="#resize-image-options" data-toggle="tab">
                        <i class="zmdi zmdi-wallpaper"></i>
                        <span class="ba-tooltip ba-bottom">Resize</span>
                    </a>
                </li>
                <li>
                    <a href="#crop-image-options" data-toggle="tab">
                        <i class="zmdi zmdi-crop"></i>
                        <span class="ba-tooltip ba-bottom">Crop</span>
                    </a>
                </li>
                <li>
                    <a href="#filter-effects-image-options" data-toggle="tab">
                        <i class="zmdi zmdi-invert-colors"></i>
                        <span class="ba-tooltip ba-bottom">Filter and Effects</span>
                    </a>
                </li>
                <li>
                    <a href="#adjust-image-options" data-toggle="tab">
                        <i class="zmdi zmdi-tune"></i>
                        <span class="ba-tooltip ba-bottom">Adjust</span>
                    </a>
                </li>
                <li>
                    <a href="#flip-rotate-image-options" data-toggle="tab">
                        <i class="zmdi zmdi-flip"></i>
                        <span class="ba-tooltip ba-bottom">Flip and Rotate</span>
                    </a>
                </li>
                <span class="photo-editor-save-image" data-context="save-image-context-menu">
                    <span>Save</span>
                    <i class="zmdi zmdi-caret-down"></i>
                </span>
            </ul>
            <div class="tabs-underline" style="left: 0px; right: 1914px;"></div>
            <div class="resize-image-wrapper">
                <div>
                    <canvas id="photo-editor"></canvas>
                </div>
                <div class="ba-crop-overlay" style="opacity: 0;">
                    <canvas id="ba-overlay-canvas"></canvas>
                    <span class="ba-crop-overlay-resize-handle" data-resize="top-left"></span>
                    <span class="ba-crop-overlay-resize-handle" data-resize="top-right"></span>
                    <span class="ba-crop-overlay-resize-handle" data-resize="bottom-left"></span>
                    <span class="ba-crop-overlay-resize-handle" data-resize="bottom-right"></span>
                </div>
            </div>
            <span class="show-photo-media-editor">
                <i class="zmdi zmdi-camera"></i>
                <span class="ba-tooltip ba-top">SELECT_PICTURE_TO_START_EDIT</span>
            </span>
            <div class="tab-content">
                <div id="resize-image-options" class="row-fluid tab-pane active">
                    <div class="ba-settings-group">
                        <div class="ba-settings-toolbar">
                            <div>
                                <span>Width</span>
                                <input type="number" class="resize-width" data-callback="emptyCallback">
                            </div>
                            <div>
                                <span>Height</span>
                                <input type="number" class="resize-height" data-callback="emptyCallback">
                            </div>
                        </div>
                        <div class="ba-settings-item">
                            <span>Quality</span>
                            <div class="ba-range-wrapper">
                                <span class="ba-range-liner"></span>
                                <input type="range" class="ba-range" min="0" max="100">
                                <input type="number" class="photo-editor-quality" data-callback="photoEditorQuality">
                            </div>
                        </div>
                    </div>
                    <div class="photo-editor-footer">
                        <a href="#" class="reset-image">Reset</a>
                        <a href="#" class="resize-action">Apply</a>
                    </div>
                </div>
                <div id="crop-image-options" class="row-fluid tab-pane">
                    <div class="ba-settings-group">
                        <div class="ba-settings-toolbar">
                            <div>
                                <span>Width</span>
                                <input type="number" class="crop-width" data-callback="emptyCallback">
                            </div>
                            <div>
                                <span>Height</span>
                                <input type="number" class="crop-height" data-callback="emptyCallback">
                            </div>
                        </div>
                        <div class="ba-settings-item">
                            <span>Keep Proportions</span>
                            <label class="ba-checkbox">
                                <input type="checkbox" class="keep-proportions">
                                <span></span>
                            </label>
                        </div>
                        <div class="ba-settings-item">
                            <span>Aspect Ratio</span>
                            <div class="ba-custom-select aspect-ratio-select">
                                <input readonly="" onfocus="this.blur()" type="text" value="">
                                <input type="hidden" value="3">
                                <i class="zmdi zmdi-caret-down"></i>
                                <ul>
                                    <li data-value="original">Original</li>
                                    <li data-value="1:1">1:1</li>
                                    <li data-value="3:2">3:2</li>
                                    <li data-value="3:4">3:4</li>
                                    <li data-value="16:9">16:9</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="photo-editor-footer">
                        <a href="#" class="reset-image">Reset</a>
                        <a href="#" class="crop-action">Apply</a>
                    </div>
                </div>
                <div id="filter-effects-image-options" class="row-fluid tab-pane">
                    <div class="ba-settings-group">
                        <div class="filter-effects-thumbnail">
                            <canvas class="filter-effect-canvas" data-key="original"></canvas>
                            <span>original</span>
                        </div>
                        <div class="filter-effects-thumbnail">
                            <canvas class="filter-effect-canvas" data-key="1977"></canvas>
                            <span>1977</span>
                        </div>
                        <div class="filter-effects-thumbnail">
                            <canvas class="filter-effect-canvas" data-key="aden"></canvas>
                            <span>Aden</span>
                        </div>
                        <div class="filter-effects-thumbnail">
                            <canvas class="filter-effect-canvas" data-key="amaro"></canvas>
                            <span>Amaro</span>
                        </div>
                        <div class="filter-effects-thumbnail">
                            <canvas class="filter-effect-canvas" data-key="brannan"></canvas>
                            <span>Brannan</span>
                        </div>
                        <div class="filter-effects-thumbnail">
                            <canvas class="filter-effect-canvas" data-key="brooklyn"></canvas>
                            <span>Brooklyn</span>
                        </div>
                        <div class="filter-effects-thumbnail">
                            <canvas class="filter-effect-canvas" data-key="clarendon"></canvas>
                            <span>Clarendon</span>
                        </div>
                        <div class="filter-effects-thumbnail">
                            <canvas class="filter-effect-canvas" data-key="earlybird"></canvas>
                            <span>Earlybird</span>
                        </div>
                        <div class="filter-effects-thumbnail">
                            <canvas class="filter-effect-canvas" data-key="gingham"></canvas>
                            <span>Gingham</span>
                        </div>
                        <div class="filter-effects-thumbnail">
                            <canvas class="filter-effect-canvas" data-key="hudson"></canvas>
                            <span>Hudson</span>
                        </div>
                        <div class="filter-effects-thumbnail">
                            <canvas class="filter-effect-canvas" data-key="inkwell"></canvas>
                            <span>Inkwell</span>
                        </div>
                        <div class="filter-effects-thumbnail">
                            <canvas class="filter-effect-canvas" data-key="lofi"></canvas>
                            <span>Lofi</span>
                        </div>
                        <div class="filter-effects-thumbnail">
                            <canvas class="filter-effect-canvas" data-key="maven"></canvas>
                            <span>Maven</span>
                        </div>
                        <div class="filter-effects-thumbnail">
                            <canvas class="filter-effect-canvas" data-key="perpetua"></canvas>
                            <span>Perpetua</span>
                        </div>
                        <div class="filter-effects-thumbnail">
                            <canvas class="filter-effect-canvas" data-key="reyes"></canvas>
                            <span>Reyes</span>
                        </div>
                        <div class="filter-effects-thumbnail">
                            <canvas class="filter-effect-canvas" data-key="stinson"></canvas>
                            <span>Stinson</span>
                        </div>
                        <div class="filter-effects-thumbnail">
                            <canvas class="filter-effect-canvas" data-key="toaster"></canvas>
                            <span>Toaster</span>
                        </div>
                        <div class="filter-effects-thumbnail">
                            <canvas class="filter-effect-canvas" data-key="walden"></canvas>
                            <span>Walden</span>
                        </div>
                        <div class="filter-effects-thumbnail">
                            <canvas class="filter-effect-canvas" data-key="valencia"></canvas>
                            <span>Valencia</span>
                        </div>
                        <div class="filter-effects-thumbnail">
                            <canvas class="filter-effect-canvas" data-key="xpro2"></canvas>
                            <span>Xpro2</span>
                        </div>
                    </div>
                    <div class="photo-editor-footer">
                        <a href="#" class="reset-image">Reset</a>
                        <a href="#" class="filter-effects-action">Apply</a>
                    </div>
                </div>
                <div id="adjust-image-options" class="row-fluid tab-pane">
                    <div class="ba-settings-group">
                        <div class="ba-settings-item">
                            <span>Contrast</span>
                            <div class="ba-range-wrapper">
                                <span class="ba-range-liner"></span>
                                <input type="range" class="ba-range" min="0" max="200" step="1">
                                <input type="number" data-filter="contrast" data-callback="photoEditorFilters">
                            </div>
                        </div>
                        <div class="ba-settings-item">
                            <span>Brightness</span>
                            <div class="ba-range-wrapper">
                                <span class="ba-range-liner"></span>
                                <input type="range" class="ba-range" min="0" max="200" step="1">
                                <input type="number" data-filter="brightness" data-callback="photoEditorFilters">
                            </div>
                        </div>
                        <div class="ba-settings-item">
                            <span>Saturate</span>
                            <div class="ba-range-wrapper">
                                <span class="ba-range-liner"></span>
                                <input type="range" class="ba-range" min="0" max="200" step="1">
                                <input type="number" data-filter="saturate" data-callback="photoEditorFilters">
                            </div>
                        </div>
                        <div class="ba-settings-item">
                            <span>Sepia</span>
                            <div class="ba-range-wrapper">
                                <span class="ba-range-liner"></span>
                                <input type="range" class="ba-range" min="0" max="100" step="1">
                                <input type="number" data-filter="sepia" data-callback="photoEditorFilters">
                            </div>
                        </div>
                        <div class="ba-settings-item">
                            <span>Grayscale</span>
                            <div class="ba-range-wrapper">
                                <span class="ba-range-liner"></span>
                                <input type="range" class="ba-range" min="0" max="100" step="1">
                                <input type="number" data-filter="grayscale" data-callback="photoEditorFilters">
                            </div>
                        </div>
                        <div class="ba-settings-item">
                            <span>Blur</span>
                            <div class="ba-range-wrapper">
                                <span class="ba-range-liner"></span>
                                <input type="range" class="ba-range" min="0" max="10" step="1">
                                <input type="number" data-filter="blur" data-callback="photoEditorFilters">
                            </div>
                        </div>
                    </div>
                    <div class="photo-editor-footer">
                        <a href="#" class="reset-image">Reset</a>
                        <a href="#" class="adjust-action">Apply</a>
                    </div>
                </div>
                <div id="flip-rotate-image-options" class="row-fluid tab-pane">
                    <span>
                        <i class="zmdi zmdi-rotate-left rotate-action" data-rotate="-90"></i>
                        <span class="ba-tooltip ba-bottom">Rotate Left</span>
                    </span>
                    <span>
                        <i class="zmdi zmdi-rotate-right rotate-action" data-rotate="90"></i>
                        <span class="ba-tooltip ba-bottom">Rotate Right</span>
                    </span>
                    <span>
                        <i class="zmdi zmdi-flip flip-action" data-flip="horizontal"></i>
                        <span class="ba-tooltip ba-bottom">Flip Horizontal</span>
                    </span>
                    <span>
                        <i class="zmdi zmdi-flip flip-action" data-flip="vertical"></i>
                        <span class="ba-tooltip ba-bottom">Flip Vertical</span>
                    </span>
                    <div class="photo-editor-footer">
                        <a href="#" class="reset-image">Reset</a>
                        <a href="#" class="flip-rotate-action">Apply</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="save-copy-dialog" class="ba-modal-sm modal hide">
    <div class="modal-body">
        <h3 class="ba-modal-title">
            Save as Copy        </h3>
        <div class="ba-input-lg">
            <input type="text" class="photo-editor-file-title reset-input-margin" placeholder="Enter file name">
            <span class="focus-underline"></span>
        </div>
        <div class="ba-checkbox-parent">
            <label class="ba-checkbox ba-hide-checkbox">
                <input type="checkbox" class="save-as-webp">
                <span></span>
            </label>
            <label>Save as WebP</label>
        </div>
    </div>
    <div class="modal-footer">
        <a href="#" class="ba-btn" data-dismiss="modal">
            Cancel        </a>
        <a href="#" class="ba-btn-primary disable-button" id="apply-save-copy">
            Save        </a>
    </div>
</div>
<div id="save-copy-notice-dialog" class="ba-modal-sm modal hide">
    <div class="modal-body">
        <h3 class="ba-modal-title">
            Save as Copy        </h3>
        <p class="modal-text">The file already exists. Do you want to overwrite it?</p>
    </div>
    <div class="modal-footer">
        <a href="#" class="ba-btn" data-dismiss="modal">
            Cancel        </a>
        <a href="#" class="ba-btn-primary red-btn" id="apply-overwrite-copy">
            Save        </a>
    </div>
</div>
<div class="ba-context-menu save-image-context-menu" style="display: none;">
    <span class="photo-editor-save-copy">
        <span>Save as Copy</span>
    </span>
    <span class="save-photo-editor-image">
        <span>Save</span>
    </span>
</div>
					</main>
				</div>
							</div>
					</section>
	</div>



<!-- //container -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>