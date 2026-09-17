window.addEventListener('message', function (event) {
    var notification = document.getElementById('notification');
    var notificationContent = document.getElementById('notificationContent');

    if (event.data.type === 'OpenNotification') {
        var notificationText = event.data.Text;
        
        notificationContent.innerHTML = notificationText;
        notification.classList.add('active');
		
    } else if (event.data.type === 'CloseNotification') {
        closeNotification();
    }
});

function closeNotification() {
    var notification = document.getElementById('notification');
    
    // Masquer la notification
    notification.classList.remove('active');
}
