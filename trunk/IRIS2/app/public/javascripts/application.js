$(function() {
    var dqt = new IrisDqt();
    dqt.init();
});

/**
 * Class to encapsulate Data Query Tool JavaScript functionality
 */
function IrisDqt() {

    // Assign this to instance to avoid conflict with jQuery $(this)
    var instance = this;

    // Layout attributes
    this.container           = 'div.dqtContainer';
    this.content             = 'div#content';
    this.fixedClass          = 'dqtFixed';
    this.fluidClass          = 'dqtFluid';

    // Workflow attributes
    this.selectAll           = 'input#selectAll';

    // Loading attributes
    this.loading             = 'div#dqtLoading';
    this.questionText        = 'div#dqtQuestionText';

    // Question tree attributes
    this.tree                = 'div#tree';
    this.treeWidth           = 350;
    this.hierarchy           = 'div#hierarchy';
    this.handle              = 'div#treeHandle';
    this.collapsedClass      = 'collapsed';
    this.questionTree        = 'div.questionTree',
    this.question            = 'a.question';
    this.questionShowHide    = 'a.showHide';

    // Question display attributes
    this.questionnaire       = 'div.questionnaire';
    this.expandAll           = 'a#expandAll';
    this.collapseAll         = 'a#collapseAll';
    this.toggle              = 'a.toggle';
    this.questionHead        = 'div.questionHead';
    this.questionBody        = 'div.questionBody';
    this.memberStateHead     = 'div.memberStateHead';
    this.memberStateBody     = 'div.memberStateBody';
    this.answerHead          = 'div.answerHead';
    this.answerBody          = 'div.answerBody';
    this.viewQuestionContext = 'a.viewQuestionContext';
    this.questionContext     = 'div.questionContext';
    this.viewQuestionChart   = 'a.viewQuestionChart';


    /**
     * Function to initialise data query tool JavaScript functionality
     */
    this.init = function() {
        // JavaScript enabled - prepare DQT for fluid rendering
        $(instance.container).addClass(instance.fluidClass).removeClass(instance.fixedClass);
        
        // Initialise application elements
        instance.initWorkflow();
        instance.initTree();
        instance.initAjax();
        instance.initContentLoading();
        instance.initQuestionContext();
        instance.initQuestionChart();
        instance.initAccordions();
    };

    /**
     * Function to intialise workflow select all functionality
     */
    this.initWorkflow = function() {
        // Show select all checkbox
        $(instance.selectAll).closest('span').show();

        // Bind click event to select all checkbox
        $(instance.selectAll).bind('click', function() {
            var checked = $(instance.selectAll).is(':checked');
            $('input[type=checkbox]:enabled').attr('checked', checked);
        });
    };

    /**
     * Function to intialise collapsable tree
     */
    this.initTree = function() {
        // Initialise question tree state to collapsed
        $(instance.tree).addClass(instance.collapsedClass);

        // Bind click event to tree handle
        $(instance.handle).click(function() {
            if($(instance.tree).hasClass(instance.collapsedClass)) {
                instance.expandTree();
            }else {
                instance.collapseTree();
            }
        });

        // Bind tree position to window scroll position
        if($(instance.tree).length) {
            var treeStart = $(instance.tree).offset().top;

            $(window).scroll(function() {
                var windowPosition = $(window).scrollTop();

                if(windowPosition < treeStart) {
                    $(instance.tree).css({'top': 0});
                } else {
                    $(instance.tree).stop().animate({'top': windowPosition - treeStart + 10}, 500);
                }
            });
        }
    };

    /**
     * Function to initialise question tree
     * @param options
     */
    this.initQuestionTree = function(options) {
        // Remove all nested unordered lists from question tree
        $(instance.questionTree + ' ul').remove();

        // Add question tree plugin to each question tree container
        $('div#questionTree1').questionTree({
            script: options.action1
        });

        $('div#questionTree2').questionTree({
            script: options.action2
        });
    };

    /**
     * Function to initialise ajax start and stop actions
     */
    this.initAjax = function() {
        // Initialise ajax start/stop actions
        $(instance.loading).ajaxStart(function() {
            // Fade in loading message and fade out content
            $(this).fadeIn(500);
        }).ajaxStop(function() {
            // Fade out loading message and fade in content
            $(this).fadeOut(500);
        });
    };

    /**
     * Function to initialise asynchronous content loading
     */
    this.initContentLoading = function() {
        // Bind click event to present and future question links
        $(instance.question).live('click mousedown', function(event) {
            event.preventDefault();
            var href = $(this).attr('href');
            instance.requestContent(href);
            return false;
        });

        // Bind hover event to question and future tree question links
        $(instance.hierarchy + ' ' + instance.question).live('mouseover', function() {
            // Retrieve question title and add question text and display above overlay
            var questionText = $(this).attr('title');
            var position = $(instance.handle).offset().top - 170;
            $(instance.questionText).html('<span>' + questionText + '</span>').css({'top': position}).show();

        }).live('mouseout', function() {
            // Hide and remove question text from display above overlay
            $(instance.questionText).hide().children('span').remove();
        });
    };

    /**
     * Method to asynchronously request content from specified href
     */
    this.requestContent = function(href) {
        $.ajax({
            url: href,
            cache: false,
            beforeSend: function() {
                instance.collapseTree();
                $(instance.content).fadeOut(500);
            },
            complete: function() {
                $(instance.content).fadeIn(500);
            },
            error: function() {
                $(instance.content).html("<p><strong>We're sorry, but an unexpected error has occured.</strong></p>");
            },
            success: function(response) {
                $(instance.content).html(response);

                // Re-initialise accordions after content load
                instance.initAccordions();
                instance.initQuestionChart();
            }
        });
    };

    /**
     * Function to initialise comparison accordions
     */
    this.initAccordions = function() {
        // Initialise expand/collapse all links
        $(instance.expandAll).click(function(event) {
            event.preventDefault();
            $(instance.questionBody + ', ' + instance.memberStateBody + ', ' + instance.answerBody).slideDown(500);
        });
        $(instance.collapseAll).click(function(event) {
            event.preventDefault();
            $(instance.questionBody + ', ' + instance.memberStateBody + ', ' + instance.answerBody).slideUp(500);
        });

        // Initialise with first question for each reporting period expanded
        $(instance.questionnaire).each(function() {
            $(this).children(instance.questionBody).hide();
            $(this).children(instance.questionBody + ':first').show();
        });

        $(instance.questionHead + ' ' + instance.toggle).click(function(event) {
            event.preventDefault();
            $(this).parents(instance.questionHead).next(instance.questionBody).slideToggle(500);
        });

        $(instance.memberStateHead + ' ' + instance.toggle).click(function(event) {
            event.preventDefault();
            $(this).parents(instance.memberStateHead).next(instance.memberStateBody).slideToggle(500);
        });

        $(instance.answerHead + ' ' + instance.toggle).click(function(event) {
            event.preventDefault();
            $(this).parents(instance.answerHead).next(instance.answerBody).slideToggle(500);
        });
    }

    /**
     * Function to expand question tree
     */
    this.expandTree = function() {
        $(instance.tree).animate({'left':'0'}, 500).removeClass(instance.collapsedClass);
    };

    /**
     * Function to collapse question tree
     */
    this.collapseTree = function() {
        $(instance.tree).animate({'left':'-' + instance.treeWidth + 'px'}, 500).addClass(instance.collapsedClass);
    };

    /**
     * Function to initialise showing/hidding of question context
     */
    this.initQuestionContext = function() {
        // Bind click event to present question context links only
        $(instance.viewQuestionContext).live('click', function(event) {
            event.preventDefault();
            var context = $(this).parents(instance.questionHead).children(instance.questionContext);

            // Check whether context should be shown or hidden
            if($(context).hasClass(instance.collapsedClass)) {
                $(context).removeClass(instance.collapsedClass).slideDown(500);
            } else {
                $(context).addClass(instance.collapsedClass).slideUp(500);
            }
        });
    };

    /**
     * Function to initialise question chart lightbox
     */
    this.initQuestionChart = function() {
        // Show view question chart
        $(instance.viewQuestionChart).fancybox({
            titleShow: false,
            height: 500,
            width: 800,
            overlayColor: '#333',
            overlayOpacity: 0.8
        }).show();
    }

}