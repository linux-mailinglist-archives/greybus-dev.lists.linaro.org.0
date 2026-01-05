Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7B8CF2F13
	for <lists+greybus-dev@lfdr.de>; Mon, 05 Jan 2026 11:16:50 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B3AC74014F
	for <lists+greybus-dev@lfdr.de>; Mon,  5 Jan 2026 10:16:49 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	by lists.linaro.org (Postfix) with ESMTPS id F40983F836
	for <greybus-dev@lists.linaro.org>; Mon,  5 Jan 2026 10:16:45 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=s45qYQTW;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.128.50 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so103782155e9.0
        for <greybus-dev@lists.linaro.org>; Mon, 05 Jan 2026 02:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767608205; x=1768213005; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iV+UDzommVY2aDcUuH+0k89DYiMteCt8ig5zrzxx51k=;
        b=s45qYQTW5VzwFMWzD0psxh6fJMR2LtdFXGCuMNoIAebh0bSUTt36bM0a47Wos2e3c7
         URfJMCpMwGMn2QT2Ayt9YX3/eMnvH12sJdsih1+y9TpgHqgDXocl1Fy+A8tAERZh8o20
         jNQyxLJQf9RCvwvaokAngK/Oj+sjd9fhHy+wCdTdr+u6jxWfWj4aDTFXbyU5aeyDKo8X
         jpqVrIE+Yx2/9R+PFG0NixXPhk9G97FAdN7YSDXlG/4fVsbH49/FXlgPYq2YOJR7+6iO
         +mwptviwIz1jDOjLvXovsvzOMWPjY2j7+/iTUrm2GG1mD9eZ4pNgiyYfbpFUKc/CNamG
         CP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767608205; x=1768213005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iV+UDzommVY2aDcUuH+0k89DYiMteCt8ig5zrzxx51k=;
        b=ioDayafRUm/p2aEfpKGxtkhyEJA2HEeFiO0RyCqiDQRohzVeyP3TC6pkmCCAE2FHIe
         sF+knslLR3nSMZ3xbNWE86dYQtR8mInV5kKbRNvC5eNewqU52AiBA55x49veZqWOMMTv
         U5Zd+gd5/DeJuwJ+WIUR0WzugQHlaMjmLKupNvPEv259HkLiCiFnaVcfoHXUx8859Osj
         Ak7EihiXqmFZ9aNoS0ysgolN9knU+UTmrZUFUUmAyA3w/3Srdk1A6Lfna5DR3q5unS3e
         sb9a563vgNNOQ8lUF4f49PhaCcO2u9lkH/2xd1DAL0YmYiLwT2qz6tomYEhleONzaLPt
         qktg==
X-Forwarded-Encrypted: i=1; AJvYcCXFn3Q66gCbOvG+MYsP7/qQkfCp8ZDTsqr+0KQVi0gZT3bpcwxUQdhzMjj5cVoRLppXZYYuI+AEixP3Aw==@lists.linaro.org
X-Gm-Message-State: AOJu0YystjmiV1Y4hkxxnbeyeXzcKI7NISAjmbvi24bc+Esietcjnec/
	eOh/qBd7zKn+EHvG5Cgs00iHCCDJT4HC/dHueBH4avcoK78zXorsEwCa8TtZclB5jn16aQ==
X-Gm-Gg: AY/fxX7TW8DsoGj4+Ur93QOEq+g6Xsf1OfB96WhSlXR/ywJE1Se4ZT2WXN5QQfZxCFP
	Wy7yI+9g9iEtYc/5R47ML2R0S7PulVmvzEWmwOaerKS30hrRPZSPb/9ay0/x/KHuZj49oQf3MM9
	zmW5lUqj4AtzAM9drwmEb1hpuLlcSD+GUYLqIMU/y8HZ66dhsRzO/jXBGH/idOdZxL2Pf+XC4u6
	wuC9LkAD3SifvxHhsmTZjpu0/g1lH1gIwHden87RpZOLJFq9QBjpuivX+ZNbqhOsFZMjMpecX7B
	K8wqrlRP9LlWxvTVTLCFtHofsYTseXSHmgx14afPAGnK1EZOTVmp20PXmRC2WmpNrmn6iHSJ9+0
	VmJK24q3UejYhU2RlZ4KBsaHMZg5UXO2JMrzsPvbemGkybfKyr3WuM+ntYMIli/PUo4UYC6xMnP
	+HSi9IQxdeiDsQU350
X-Google-Smtp-Source: AGHT+IECuo5OdIdd8uBzJRpVSu3a+jGgOiKpMmMmsG02MDoyX754e87kGTbCK4yDQtoy9l/ScP/qiA==
X-Received: by 2002:a05:600d:108:20b0:477:9986:5e6b with SMTP id 5b1f17b1804b1-47d1c038664mr424336255e9.28.1767608204857;
        Mon, 05 Jan 2026 02:16:44 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4327778e27bsm66369075f8f.12.2026.01.05.02.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:16:44 -0800 (PST)
Date: Mon, 5 Jan 2026 13:16:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <aVuPidYUPZxCOdRp@stanley.mountain>
References: <20251230062704.3339404-1-rdunlap@infradead.org>
 <d81069b8-04fa-437c-8bbc-51360784952a@infradead.org>
 <aVuNzWb3TEj74t2M@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aVuNzWb3TEj74t2M@stanley.mountain>
X-Rspamd-Queue-Id: F40983F836
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.50:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	URIBL_BLOCKED(0.00)[linuxfoundation.org:email,arndb.de:email];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: BYTP2PKUDJUTI2GBHY3C6LM5P6KU3JPV
X-Message-ID-Hash: BYTP2PKUDJUTI2GBHY3C6LM5P6KU3JPV
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: arche: drop dangling Kconfig symbol
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BYTP2PKUDJUTI2GBHY3C6LM5P6KU3JPV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 05, 2026 at 01:09:17PM +0300, Dan Carpenter wrote:
> On Tue, Dec 30, 2025 at 10:23:40AM -0800, Randy Dunlap wrote:
> > 
> > 
> > On 12/29/25 10:27 PM, Randy Dunlap wrote:
> > > --- linux-next-20251219.orig/drivers/staging/greybus/Kconfig
> > > +++ linux-next-20251219/drivers/staging/greybus/Kconfig
> > > @@ -206,7 +206,6 @@ endif	# GREYBUS_BRIDGED_PHY
> > >  
> > >  config GREYBUS_ARCHE
> > >  	tristate "Greybus Arche Platform driver"
> > > -	depends on USB_HSIC_USB3613 || COMPILE_TEST
> > >  	help
> > >  	  Select this option if you have an Arche device.
> > 
> > Perhaps I should have left COMPILE_TEST here, like:
> > 
> > 	depends on COMPILE_TEST
> > 
> > ?
> 
> If we're going to do that, we should just delete it.  It's been
> impossible to build for eight years.
> 

I did a `git grep 'depends on COMPILE_TEST'` for other drivers which
are never used and only found this one which was disabled in 2018.

regards,
dan carpenter

commit da2827a298f8a2159f31466759cbba2dd4f1b65f
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Fri Mar 9 22:45:26 2018 +0100

    usb: isp1362: remove blackfin arch glue

    The blackfin architecture is getting removed, and this is the last
    remaining architecture specific setting, so the various hacks
    can be removed now.

    From all I can tell, there are no remaining in-tree users of the
    driver, but it could be used by out-of-tree platform ports.
    I've marked the driver as 'depends on COMPILE_TEST', short of
    removing it outright.

    It was originally written for some ARM PXA machines using the same
    chip, but that platform never really worked and the code has been
    removed a long time ago.

    Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
    Acked-by: Aaron Wu <aaron.wu@analog.com>
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 4fcfb3084b36..b85822f0c874 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -360,6 +360,7 @@ config USB_ISP116X_HCD
 config USB_ISP1362_HCD
        tristate "ISP1362 HCD support"
        depends on HAS_IOMEM
+       depends on COMPILE_TEST # nothing uses this
        ---help---
          Supports the Philips ISP1362 chip as a host controller

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
