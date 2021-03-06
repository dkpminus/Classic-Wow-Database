var ContactTool = new function()
{
    this.general    = 0;
    this.comment    = 1;
    this.post       = 2;
    this.screenshot = 3;
    this.character  = 4;
    this.video      = 5;
    this.guide		= 6;

    var _dialog;

    var contexts = {
        0: [ // general
            [1, true], // General feedback
            [9, true], // Bad ads
            [2, true], // Bug report
            [8, true], // Article misinformation
            [3, true], // Typo/mistranslation
            [4, true], // Advertise with us
            [5, true], // Partnership opportunities
            [6, true], // Press inquiry
            [7, true]  // Other
        ],
        1: [ // comment
            [15, function(post) { return ((post.roles & U_GROUP_MODERATOR) == 0); }], // Advertising
            [16, true], // Inaccurate
            //[17, true], // Out of date SpiffyJr, remove Out of Date
            [18, function(post) { return ((post.roles & U_GROUP_MODERATOR) == 0); }], // Spam
            [19, function(post) { return ((post.roles & U_GROUP_MODERATOR) == 0); }], // Vulgar/inappropriate
            [20, function(post) { return ((post.roles & U_GROUP_MODERATOR) == 0); }] // Other
        ],
        2: [ // forum post
            [30, function(post) { return (g_users && g_users[post.user] && (g_users[post.user].roles & U_GROUP_MODERATOR) == 0); }], // Advertising
            [37, function(post) { return ((post.roles & U_GROUP_MODERATOR) == 0 && g_users && g_users[post.user] && (g_users[post.user].roles & U_GROUP_MODERATOR) == 0 && g_users[post.user].avatar == 2); }], // Avatar
            [31, true], // Inaccurate
            [32, true], // Out of date
            [33, function(post) { return (g_users && g_users[post.user] && (g_users[post.user].roles & U_GROUP_MODERATOR) == 0); }], // Spam
            [34, function(post) { return (g_users && g_users[post.user] && (g_users[post.user].roles & U_GROUP_MODERATOR) == 0 && post.op && !post.sticky); }], // Sticky request
            [35, function(post) { return (g_users && g_users[post.user] && (g_users[post.user].roles & U_GROUP_MODERATOR) == 0); }], // Vulgar/inappropriate
            [36, function(post) { return (g_users && g_users[post.user] && (g_users[post.user].roles & U_GROUP_MODERATOR) == 0); }]  // Other
        ],
        3: [ // screenshot
            [45, true], // Inaccurate,
            [46, true], // Out of date,
            [47, function(screen) { return (g_users && g_users[screen.user] && (g_users[screen.user].roles & U_GROUP_MODERATOR) == 0); }], // Vulgar/inappropriate
            [48, function(screen) { return (g_users && g_users[screen.user] && (g_users[screen.user].roles & U_GROUP_MODERATOR) == 0); }]  // Other
        ],
        4: [ // character
            [60, true], // Inaccurate completion data
            [61, true]  // Other
        ],
        5: [ // video
            [45, true], // Inaccurate,
            [46, true], // Out of date,
            [47, function(video) { return (g_users && g_users[video.user] && (g_users[video.user].roles & U_GROUP_MODERATOR) == 0); }], // Vulgar/inappropriate
            [48, function(video) { return (g_users && g_users[video.user] && (g_users[video.user].roles & U_GROUP_MODERATOR) == 0); }]  // Other
        ],
        6: [ // Guide
            [45, true], // Inaccurate,
            [46, true], // Out of date,
            [48, true]  // Other
        ]
    };

    var errors = {
        1: LANG.ct_resp_error1,
        2: LANG.ct_resp_error2,
        3: LANG.ct_resp_error3,
        7: LANG.ct_resp_error7
    };

    var oldHash = null;

    var monkeyBrokerData = null;

    this.monkeyBrokerCallback = function(input)
    {
        monkeyBrokerData = input;
    }

    this.displayError = function(field, message)
    {
        alert(message);
    }

    this.onShow = function()
    {
        g_ajaxIshRequest('http://skin-test.monkeybroker.net/mb/HistoryViewer?callback=ContactTool.monkeyBrokerCallback');

        if(location.hash && location.hash != '#contact')
            oldHash = location.hash;
        if(this.data.mode == 0)
            location.replace('#contact');
    }

    this.onHide = function()
    {
        if(oldHash && (oldHash.indexOf('screenshots:') == -1 || oldHash.indexOf('videos:') == -1))
            location.replace(oldHash);
        else
            location.replace('#.');
    }

    this.onSubmit = function(data, button, form)
    {
        if(data.submitting)
            return false;

        for(var i = 0; i < form.elements.length; ++i)
            form.elements[i].disabled = true;

        var params = [
            'contact=1',
            'mode=' + urlencode(data.mode),
            'reason=' + urlencode(data.reason),
            'desc=' + urlencode(data.description),
            'ua=' + urlencode(navigator.userAgent),
            'appname=' + urlencode(navigator.appName),
            'page=' + urlencode(data.currenturl)
        ];
        if(data.mode == 0) // contact us
        {
            if(data.relatedurl)
                params.push('relatedurl=' + urlencode(data.relatedurl));
            if(data.email)
                params.push('email=' + urlencode(data.email));
        }
        else if(data.mode == 1) // comment
            params.push('id=' + urlencode(data.comment.id));
        else if(data.mode == 2) // forum post
            params.push('id=' + urlencode(data.post.id));
        else if(data.mode == 3) // screenshot
            params.push('id=' + urlencode(data.screenshot.id));
        else if(data.mode == 4) // character
            params.push('id=' + urlencode(data.profile.source));
        else if(data.mode == 5) // video
            params.push('id=' + urlencode(data.video.id));
        else if(data.mode == 6) // guide
            params.push('id=' + urlencode(data.guide.id));

        if (data.reason == 9) { // bad ads
            var adinfo = "";

            if (monkeyBrokerData) {
                adinfo += "<b>UID: " + monkeyBrokerData.uid + "</b><br/>";

                for (var i = 0; i < monkeyBrokerData.history.entries.length; i++) {
                    var entry = monkeyBrokerData.history.entries[i];
                    var date  = new Date(entry.time * 1000);

                    adinfo += "<b>eventNum:</b>" + entry.eventNum + "<br>";
                    adinfo += "<b>eventType:</b>" + entry.eventType + "<br>";
                    adinfo += "<b>eventTypeName:</b>" + entry.eventTypeName + "<br>";
                    adinfo += "<b>time:</b>" + date.toUTCString() + "<br>";
                    adinfo += "<b>bannerId:</b>" + entry.bannerId + "<br>";
                    adinfo += "<b>bannerName:</b>" + entry.bannerName + "<br>";
                    adinfo += "<b>sizeId:</b>" + entry.sizeId + "<br>";
                    adinfo += "<b>sizeName:</b>" + entry.sizeName + "<br>";
                    adinfo += "<b>campaignId:</b>" + entry.campaignId + "<br>";
                    adinfo += "<b>campaignName:</b>" + entry.campaignName + "<br>";
                    adinfo += "<br><br>";

                    if (i > 15) {
                        break;
                    }
                }
            }
            params.push('adinfo=' + adinfo);
        }

        data.submitting = true;
        var url = '/contactus';
        new Ajax(url, {
            method: 'POST',
            params: params.join('&'),
            onSuccess: function(xhr, opt) {
                var resp = xhr.responseText;
                if(resp == 0)
                {
                    if(g_user.name)
                        alert(sprintf(LANG.ct_dialog_thanks_user, g_user.name));
                    else
                        alert(LANG.ct_dialog_thanks);
                    Lightbox.hide();
                }
                else
                {
                    if(errors[resp])
                        alert(errors[resp]);
                    else
                        alert('Error: ' + resp);
                }
            },
            onFailure: function(xhr, opt) {
                alert('Failure submitting contact request: ' + xhr.statusText);
            },
            onComplete: function(xhr, opt) {
                for(var i = 0; i < form.elements.length; ++i)
                    form.elements[i].disabled = false;
                data.submitting = false;
            }
        });
        return false;
    }

    this.show = function(opt)
    {
        if(!opt)
            opt = {};
        var data = { mode: 0 };
        cO(data, opt);
        data.reasons = contexts[data.mode];
        if(location.href.indexOf('#contact') != -1)
            data.currenturl = location.href.substr(0, location.href.indexOf('#contact'));
        else
            data.currenturl = location.href;
        var form = 'contactus';
        if(data.mode != 0)
            form = 'reportform';

        if(!_dialog)
        {
            this.init();
        }

        _dialog.show(form, { data: data, onShow: this.onShow, onHide: this.onHide, onSubmit: this.onSubmit });
    }

    this.checkPound = function()
    {
        if(location.hash && location.hash == '#contact')
        {
            ContactTool.show();
        }
    }

    var dialog_contacttitle;
        dialog_contacttitle = 'Contact Thottbot';

    this.init = function()
    {
        _dialog = new Dialog();

        Dialog.templates.contactus = {
            title: dialog_contacttitle,
            width: 550,
            buttons: [['check', LANG.ok], ['x', LANG.cancel]],

            fields:
                [
                    {
                        id: 'reason',
                        type: 'select',
                        label: LANG.ct_dialog_reason,
                        required: 1,
                        options: [],
                        compute: function(field, value, form, td)
                        {
                            ee(field);

                            for(var i = 0; i < this.data.reasons.length; ++i)
                            {
                                var id = this.data.reasons[i][0];
                                var check = this.data.reasons[i][1];
                                var valid = false;
                                if(typeof check == 'function')
                                    valid = check(this.extra);
                                else
                                    valid = check;

                                if(!valid)
                                    continue;

                                var o = ce('option');
                                o.value = id;
                                if(value && value == id)
                                    o.selected = true;
                                ae(o, ct(g_contact_reasons[id]));
                                ae(field, o);
                            }

                            field.onchange = function()
                            {
                                if(this.value == 1 || this.value == 2 || this.value == 3)
                                {
                                    form.currenturl.parentNode.parentNode.style.display = '';
                                    form.relatedurl.parentNode.parentNode.style.display = '';
                                } else if (this.value == 9) {
                                    form.currenturl.parentNode.parentNode.style.display = '';
                                    form.relatedurl.parentNode.parentNode.style.display = 'none';
                                }
                                else
                                {
                                    form.currenturl.parentNode.parentNode.style.display = 'none';
                                    form.relatedurl.parentNode.parentNode.style.display = 'none';
                                }
                            }.bind(field);

                            td.style.width = '98%';
                        },
                        validate: function(newValue, data, form)
                        {
                            var error = '';
                            if(!newValue || newValue.length == 0)
                                error = LANG.ct_dialog_error_reason;

                            if(error == '')
                                return true;

                            ContactTool.displayError(form.reason, error);
                            form.reason.focus();
                            return false;
                        }
                    },
                    {
                        id: 'currenturl',
                        type: 'text',
                        disabled: true,
                        label: LANG.ct_dialog_currenturl,
                        size: 40
                    },
                    {
                        id: 'relatedurl',
                        type: 'text',
                        label: LANG.ct_dialog_relatedurl,
                        caption: LANG.ct_dialog_optional,
                        size: 40,
                        validate: function(newValue, data, form)
                        {
                            var error = '';
                            var urlRe = /^(http(s?)\:\/\/|\/)?([\w]+:\w+@)?([a-zA-Z]{1}([\w\-]+\.)+([\w]{2,5}))(:[\d]{1,5})?((\/?\w+\/)+|\/?)(\w+\.[\w]{3,4})?((\?\w+=\w+)?(&\w+=\w+)*)?/;
                            newValue = newValue.trim();
                            if(newValue.length >= 250)
                                error = LANG.ct_dialog_error_relatedurl;
                            else if(newValue.length > 0 && !urlRe.test(newValue))
                                error = LANG.ct_dialog_error_invalidurl;

                            if(error == '')
                                return true;

                            ContactTool.displayError(form.relatedurl, error);
                            form.relatedurl.focus();
                            return false;
                        }
                    },
                    {
                        id: 'email',
                        type: 'text',
                        label: LANG.ct_dialog_email,
                        caption: LANG.ct_dialog_email_caption,
                        compute: function(field, value, form, td, tr)
                        {
                            if(g_user.email)
                            {
                                this.data.email = g_user.email;
                                tr.style.display = 'none';
                            }
                            else
                            {
                                var func = function()
                                {
                                    $('#contact-emailwarn').css('display', g_isEmailValid($(form.email).val()) ? 'none' : '');
                                    Lightbox.reveal();
                                };

                                $(field).keyup(func).blur(func);
                            }
                        },
                        validate: function(newValue, data, form)
                        {
                            var error = '';
                            newValue = newValue.trim();
                            if(newValue.length >= 100)
                                error = LANG.ct_dialog_error_emaillen;
                            else if(newValue.length > 0 && !g_isEmailValid(newValue))
                                error = LANG.ct_dialog_error_email;

                            if(error == '')
                                return true;

                            ContactTool.displayError(form.email, error);
                            form.email.focus();
                            return false;
                        }
                    },
                    {
                        id: 'description',
                        type: 'textarea',
                        caption: LANG.ct_dialog_desc_caption,
                        width: '98%',
                        required: 1,
                        size: [10, 30],
                        validate: function(newValue, data, form)
                        {
                            var error = '';
                            newValue = newValue.trim();
                            if(newValue.length == 0 || newValue.length > 10000)
                                error = LANG.ct_dialog_error_desc;

                            if(error == '')
                                return true;

                            ContactTool.displayError(form.description, error);
                            form.description.focus();
                            return false;
                        }
                    },
                    {
                        id: 'noemailwarning',
                        type: 'caption',
                        compute: function(field, value, form, td)
                        {
                            $(td).html('<span id="contact-emailwarn" class="q10"' + (g_user.email ? ' style="display: none"' : '') + '>' + LANG.ct_dialog_noemailwarning + '</span>').css('white-space', 'normal').css('padding', '0 4px');
                        }
                    }
                ],

            onInit: function(form)
            {

            },

            onShow: function(form)
            {
                if(this.data.focus && form[this.data.focus])
                    setTimeout(g_setCaretPosition.bind(null, form[this.data.focus], form[this.data.focus].value.length), 100);
                else if(form['reason'] && !form.reason.value)
                    setTimeout(bindfunc(form.reason.focus, form.reason), 10);
                else if(form['relatedurl'] && !form.relatedurl.value)
                    setTimeout(bindfunc(form.relatedurl.focus, form.relatedurl), 10);
                else if(form['email'] && !form.email.value)
                    setTimeout(bindfunc(form.email.focus, form.email), 10);
                else if(form['description'] && !form.description.value)
                    setTimeout(bindfunc(form.description.focus, form.description), 10);
                setTimeout(Lightbox.reveal, 250);
            }
        }

        Dialog.templates.reportform = {
            title: LANG.ct_dialog_report,
            width: 550,
            buttons: [['check', LANG.ok], ['x', LANG.cancel]],

            fields:
                [
                    {
                        id: 'reason',
                        type: 'select',
                        label: LANG.ct_dialog_reason,
                        options: [],
                        compute: function(field, value, form, td)
                        {
                            switch(this.data.mode)
                            {
                                case 1: // comment
                                    form.firstChild.innerHTML = sprintf(LANG.ct_dialog_reportcomment, '<a href="/user=' + this.data.comment.user + '">' + this.data.comment.user + '</a>');
                                    break;
                                case 2: // forum post
                                    var rep = '<a href="/user=' + this.data.post.user + '">' + this.data.post.user + '</a>';
                                    if(this.data.post.op)
                                        form.firstChild.innerHTML = sprintf(LANG.ct_dialog_reporttopic, rep);
                                    else
                                        form.firstChild.innerHTML = sprintf(LANG.ct_dialog_reportpost, rep);
                                    break;
                                case 3: // screenshot
                                    form.firstChild.innerHTML = sprintf(LANG.ct_dialog_reportscreen, '<a href="/user=' + this.data.screenshot.user + '">' + this.data.screenshot.user + '</a>');
                                    break;
                                case 4: // character
                                    ee(form.firstChild);
                                    ae(form.firstChild, ct(LANG.ct_dialog_reportchar));
                                    break;
                                case 5: // video
                                    form.firstChild.innerHTML = sprintf(LANG.ct_dialog_reportvideo, '<a href="/user=' + this.data.video.user + '">' + this.data.video.user + '</a>');
                                    break;
                                case 6: // guide
                                    form.firstChild.innerHTML = 'Report guide';
                                    break;
                            }
                            form.firstChild.setAttribute('style', '');

                            ee(field);

                            var extra;
                            if(this.data.mode == 1)
                                extra = this.data.comment;
                            else if(this.data.mode == 2)
                                extra = this.data.post;
                            else if(this.data.mode == 3)
                                extra = this.data.screenshot;
                            else if(this.data.mode == 4)
                                extra = this.data.profile;
                            else if(this.data.mode == 5)
                                extra = this.data.video;
                            else if(this.data.mode == 6)
                                extra = this.data.guide;

                            ae(field, ce('option', { selected: (!value), value: -1 }));

                            for(var i = 0; i < this.data.reasons.length; ++i)
                            {
                                var id = this.data.reasons[i][0];
                                var check = this.data.reasons[i][1];
                                var valid = false;
                                if(typeof check == 'function')
                                    valid = check(extra);
                                else
                                    valid = check;

                                if(!valid)
                                    continue;

                                var o = ce('option');
                                o.value = id;
                                if(value && value == id)
                                    o.selected = true;
                                ae(o, ct(g_contact_reasons[id]));
                                ae(field, o);
                            }

                            td.style.width = '98%';
                        },
                        validate: function(newValue, data, form)
                        {
                            var error = '';
                            if(!newValue || newValue == -1 || newValue.length == 0)
                                error = LANG.ct_dialog_error_reason;

                            if(error == '')
                                return true;

                            ContactTool.displayError(form.reason, error);
                            form.reason.focus();
                            return false;
                        }
                    },
                    {
                        id: 'description',
                        type: 'textarea',
                        caption: LANG.ct_dialog_desc_caption,
                        width: '98%',
                        required: 1,
                        size: [10, 30],
                        validate: function(newValue, data, form)
                        {
                            var error = '';
                            newValue = newValue.trim();
                            if(newValue.length == 0 || newValue.length > 10000)
                                error = LANG.ct_dialog_error_desc;

                            if(error == '')
                                return true;

                            ContactTool.displayError(form.description, error);
                            form.description.focus();
                            return false;
                        }
                    }
                ],

            onInit: function(form)
            {

            },

            onShow: function(form)
            {
                /* Work-around for IE7 */
                var reason = $(form).find("*[name=reason]")[0];
                var description = $(form).find("*[name=description]")[0];

                if(this.data.focus && form[this.data.focus])
                    setTimeout(g_setCaretPosition.bind(null, form[this.data.focus], form[this.data.focus].value.length), 100);
                else if(!reason.value)
                    setTimeout(bindfunc(reason.focus, reason), 10);
                else if(!description.value)
                    setTimeout(bindfunc(description.focus, description), 10);
            }
        }
    }

};
function a3(k, l, m) {
		Lightbox.setSize(400, 500);
			i = ce("div");
			i.className = "inputbox";
			//i.style.top = "70px";
			//i.style.height = "420px";
			i.style.position = "relative";
			//k.style = "width:340px; height:420px;";
			fn = ce("form");
			fn.action = "?feedback=send";
			fn.method = "post";
			fs = ce("div");
			fs.id = "feedback-subject";
			ae(i, fs);
			fh = ce("h1");
			fh.innerHTML = "Enter your username and your message";
			//fh.style.margin = "8px";
			ae(i, fh);
			fi = ce("input");
			fi.className = "sign-inup";
			fi.type = "text";
			fi.name = "username";
			fi.value = (g_user.name ? g_user.name : '');
			fi.readonly = (g_user.name ? 'true' : 'false');
			fi.maxlength = '16';
			fi.id = "username-generic";
			ae(i, fi);
			fm = ce("div");
			fm.id = "feedback-text";
			//fm.style.margin = "8px";
			ae(i, fm);
			fn.innerHTML += '<input type="submit" class="awesome" value="Submit" onclick="aowow.feedback.send();Lightbox.hide();return false">';
			//fs = ce("input");
			//fs.type = "submit";
			//fs.value = "submit";
			//fs.onclick = aowow.feedback.send;
			//ae(i, fs);
			//fn.onsubmit = "return co_validateForm(this, 2)";
			//fn.appendChild(g_createReputationBar(7635));
			ae(fn, i);
			ae(k, fn);
			if(g_pageInfo.type && g_pageInfo.typeId){
				Markup.printHtml("Page:" + g_types[g_pageInfo.type] + "=" + g_pageInfo.typeId, "feedback-subject");
			}
			Listview.funcBox.coEditAppend(ge('feedback-text'), {body: ''}, 1)

	}
var g_glyphs = {};