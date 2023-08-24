Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 478E178673A
	for <lists+greybus-dev@lfdr.de>; Thu, 24 Aug 2023 07:51:39 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 048F03EF9C
	for <lists+greybus-dev@lfdr.de>; Thu, 24 Aug 2023 05:51:38 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	by lists.linaro.org (Postfix) with ESMTPS id 315093EF9C
	for <greybus-dev@lists.linaro.org>; Thu, 24 Aug 2023 05:51:31 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=LzPQpRqj;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.167.169 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3a85c5854deso2764146b6e.0
        for <greybus-dev@lists.linaro.org>; Wed, 23 Aug 2023 22:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692856290; x=1693461090;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvEUO+PpsiqxIYb1DvPN7u6XZI7yc4pJlqyuCKQZ0E4=;
        b=LzPQpRqj9sSqAsFN8EexQ62+A2MiiyfHZyo3PY57EAbCYvy0N4MbM1qiSq795FaeGd
         adrYUEL8c+erI6efnEwgznGr5EFsxdHlWNL79JWSxgDkkHeofHB35h58I8+1KRIRCwu/
         l+yrb5KAFD2G3n/OrJdsSp7h7yScou/onE/qrHj64a7OO2PXZwJ9Iv2sc+4h7xKfC+yp
         N49kj7/3ex/mvpyqtV+DLhBtGidxcWL9qYaJ0yfZThocgEcgetFQFr1bohff/k+byKXd
         +Zf0QHOdZ97zauvZJ2+oy8i+piHGSuJhN1GVLIdvbvkIZFb6piTGTM3YXDvmV/diBH/L
         WsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692856290; x=1693461090;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WvEUO+PpsiqxIYb1DvPN7u6XZI7yc4pJlqyuCKQZ0E4=;
        b=ls8kgXdDEfepfFL6EzICbHtOJvEpv9AouSL/87hRx0LmplEMJOHpAkMTG68vddK5UR
         ucybyznEN01V/kQys8DfEgjD0GOqgsaozNti5lMFTRDx63MxcBLFmG/07okRl4hWNgwK
         6sBTDu/w+LT8XOHZ+XWz0WkJWmNQ+x0Qw3LF67uI6erS9Rgd+zEYiN7lwUYdCQ+rOLXi
         MP94N753iC4iVhPZgLEyhb2OaQ7ndfAFzDqDlnj/dbrJHRxdRJHWr6tXzTNNT3/AmKSw
         1mUAfXgcdiEXLi7w1V83yRwmAl9ePy99Ex+iur0erNbfZWOHmkktnS6uCoRKHhQqDRSO
         z/vg==
X-Gm-Message-State: AOJu0YxbhbIwy2r1mziM8XgIT+sqclzlaE0cJPeQkwWW4rZSSoPvHyOc
	WI5E1/QO50G3laxBJuHoMn4=
X-Google-Smtp-Source: AGHT+IEoe/1GPADfuRYB8fxWAruvRLtyRqqGvbcVNiOBPuSbqBk/zXbGHNxQSV94F2NCvD1Pu+ZSIg==
X-Received: by 2002:a05:6808:f8d:b0:3a7:f153:b5e5 with SMTP id o13-20020a0568080f8d00b003a7f153b5e5mr20516689oiw.29.1692856290444;
        Wed, 23 Aug 2023 22:51:30 -0700 (PDT)
Received: from [172.16.116.58] ([103.15.228.92])
        by smtp.gmail.com with ESMTPSA id b1-20020aa78701000000b0068a3dd6c1dasm7167487pfo.142.2023.08.23.22.51.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 22:51:30 -0700 (PDT)
Message-ID: <ebf72b7e-61b7-5592-8b8d-865ffc5c3e82@gmail.com>
Date: Thu, 24 Aug 2023 11:21:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Greg KH <gregkh@linuxfoundation.org>
References: <20230823165520.181301-1-ayushdevel1325@gmail.com>
 <20230823165520.181301-4-ayushdevel1325@gmail.com>
 <2023082307-untapped-automatic-ec5f@gregkh>
Content-Language: en-US
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <2023082307-untapped-automatic-ec5f@gregkh>
X-Rspamd-Queue-Id: 315093EF9C
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.linaro.org,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.167.169:from];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: WAIL2TZ36DL3RDWHGPLLJWKWP2EVXWVG
X-Message-ID-Hash: WAIL2TZ36DL3RDWHGPLLJWKWP2EVXWVG
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, hvaibhav.linux@gmail.com, elder@kernel.org, johan@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 3/4] Add HDLC helper for beagleplay driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WAIL2TZ36DL3RDWHGPLLJWKWP2EVXWVG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============3959672408960074039=="

This is a multi-part message in MIME format.
--===============3959672408960074039==
Content-Type: multipart/alternative;
 boundary="------------ViXWCgbucVrQRjKIy77SpZc5"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------ViXWCgbucVrQRjKIy77SpZc5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> And to answer this question, no, it probably shouldn't be here in
> drivers/staging/ it should be in the "real" part of the kernel as it is
> a real driver.  drivers/staging/ is for stuff that still needs work to
> do to get it out of that part of the kernel, do the work ahead of time
> and then you don't have to mess with that at all.

What do you mean by "real" part of kernel? You mean non-staging? The HDLC module/code initially started out as a part of beagleplay greybus driver (which started from wpanusb [1]). I separated it out since it should be possible to use it from other drivers which need async HDLC framing, but I am not sure how suitable it is to be used outside of UART. Thus, I do not feel it should be outside staging for now.

> No need for a .h file for a simple .c file, just put it all together
> into one file please.

Well, it is not really a standalone driver. It is supposed to be used by some other driver (like serdev) to stack HDLC on top of that. So I think it needs .h file?

> > +int hdlc_rx(struct hdlc_driver *drv, const unsigned char *data, size_t count)
> Why is this a global function?

These functions are called by any driver that wants to stack HDLC on top of the underlying transport. The HDLC files themselves can only read an HDLC frame or create an HDLC frame. It does not really care much about the underlying transport

I absolutely wish to make it clear that all the HDLC code can be put in beagleplay greybus driver (that's how it began). I just thought it might be better to separate it out for clarity and possibly allowing future drivers to use it for async HDLC framing.

Ayush Singh

[1]:https://git.beagleboard.org/beagleconnect/zephyr/wpanusb_bc

--------------ViXWCgbucVrQRjKIy77SpZc5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html data-lt-installed="true">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body style="padding-bottom: 1px;">
    <pre class="moz-quote-pre" wrap="">&gt; And to answer this question, no, it probably shouldn't be here in
&gt; drivers/staging/ it should be in the "real" part of the kernel as it is
&gt; a real driver.  drivers/staging/ is for stuff that still needs work to
&gt; do to get it out of that part of the kernel, do the work ahead of time
&gt; and then you don't have to mess with that at all.

What do you mean by "real" part of kernel? You mean non-staging? The HDLC module/code initially started out as a part of beagleplay greybus driver (which started from wpanusb [1]). I separated it out since it should be possible to use it from other drivers which need async HDLC framing, but I am not sure how suitable it is to be used outside of UART. Thus, I do not feel it should be outside staging for now. 

&gt; No need for a .h file for a simple .c file, just put it all together
&gt; into one file please.

Well, it is not really a standalone driver. It is supposed to be used by some other driver (like serdev) to stack HDLC on top of that. So I think it needs .h file?

&gt; &gt; +int hdlc_rx(struct hdlc_driver *drv, const unsigned char *data, size_t count)
&gt; Why is this a global function?

These functions are called by any driver that wants to stack HDLC on top of the underlying transport. The HDLC files themselves can only read an HDLC frame or create an HDLC frame. It does not really care much about the underlying transport

I absolutely wish to make it clear that all the HDLC code can be put in beagleplay greybus driver (that's how it began). I just thought it might be better to separate it out for clarity and possibly allowing future drivers to use it for async HDLC framing.

Ayush Singh

[1]: <a class="moz-txt-link-freetext" href="https://git.beagleboard.org/beagleconnect/zephyr/wpanusb_bc">https://git.beagleboard.org/beagleconnect/zephyr/wpanusb_bc</a></pre>
  </body>
  <lt-container></lt-container>
</html>

--------------ViXWCgbucVrQRjKIy77SpZc5--

--===============3959672408960074039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============3959672408960074039==--
