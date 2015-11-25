$(function () {
    $('.button-checkbox').each(function () {

        // Settings
        var $widget = $(this),
            $button = $widget.find('button'),
            $checkbox = $widget.find('input:checkbox'),
            color = $button.data('color'),
            settings = {
                on: {
                    icon: 'glyphicon glyphicon-check'
                },
                off: {
                    icon: 'glyphicon glyphicon-unchecked'
                }
            };

        // Event Handlers
        $button.on('click', function () {
            $checkbox.prop('checked', !$checkbox.is(':checked'));
            $checkbox.triggerHandler('change');
            updateDisplay();
        });
        $checkbox.on('change', function () {
            updateDisplay();
        });

        // Actions
        function updateDisplay() {
            var isChecked = $checkbox.is(':checked');

            // Set the button's state
            $button.data('state', (isChecked) ? "on" : "off");

            // Set the button's icon
            $button.find('.state-icon')
                .removeClass()
                .addClass('state-icon ' + settings[$button.data('state')].icon);

            // Update the button's color
            if (isChecked) {
                $button
                    .removeClass('btn-default')
                    .addClass('btn-' + color + ' active');
            }
            else {
                $button
                    .removeClass('btn-' + color + ' active')
                    .addClass('btn-default');
            }
        }

        // Initialization
        function init() {

            updateDisplay();

            // Inject the icon if applicable
            if ($button.find('.state-icon').length == 0) {
                $button.prepend('<i class="state-icon ' + settings[$button.data('state')].icon + '"></i>');
            }
        }
        init();
    });

    $('.submit-twit').click(function() {
        var post = $('.status-box').val();
        $('.counter').text('140').removeClass('warning');
        $('.submit-twit').addClass('disabled');
    });

    $('.status-box').keyup(function() {
        var postLength = $(this).val().length;
        var charsLeft = 140 - postLength;
        $('.counter').text(charsLeft);
        
        // Disables post button if message is empty
        // or too many characters.
        if (charsLeft < 0) {
            $('.submit-twit').addClass('disabled');
        } else if (charsLeft >= 140) {
            $('.submit-twit').addClass('disabled');
        } else {
            $('.submit-twit').removeClass('disabled');
        }
        
        // Turns counter color red if charsLeft <= 10
        // using "warning" class. Otherwise, counter stays black.
        if (charsLeft <= 10) {
            $('.counter').addClass('warning');
        } else {
            $('.counter').removeClass('warning');
        }
    });
    
    $('.submit-twit').addClass('disabled');
});