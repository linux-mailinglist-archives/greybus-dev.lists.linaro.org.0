Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A4HnOWrDUGro4gIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Jul 2026 12:03:22 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 8293E739689
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Jul 2026 12:03:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=plCsW+63;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org"
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A284740F3E
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Jul 2026 10:03:21 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	by lists.linaro.org (Postfix) with ESMTPS id EF3BA401CE
	for <greybus-dev@lists.linaro.org>; Thu,  9 Jul 2026 18:50:48 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6a116bd18ebso151322eaf.1
        for <greybus-dev@lists.linaro.org>; Thu, 09 Jul 2026 11:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783623048; x=1784227848; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZRHeCwFsmKFBk4M/1QJH4iLci+OyPvksYnhoTo8Soao=;
        b=plCsW+630PI1WMuOi8mI0FFxS/CW+zLUxXty79jeuKbIxmCrOzkFavqfS/ITwawR/z
         Wqu1lKKJI6OuXummeabHT+jFIWuZQZFdmJhknnwK+vmJHJHy4OQ4+CBTcMCBaoTw+PH1
         PCyBeRzDQEcxTBM8AWWDgI6QluNgPcpFan4+emCOjfZvQHWvQgXss6zFiCQYZqfIBAOY
         dO1Sg7x3oE5gvNb849/wvFiY3zeQfuRVzvMid8VgcGb6w6EnUHcsWnuNvrObNVQwP/5G
         XjPKenEZ41zDgvP/4DlpndUiTbdCS6kiWImNFPTAOpaKWTtOm4wBTOI0Liw/JUYRa0Zz
         uZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783623048; x=1784227848;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZRHeCwFsmKFBk4M/1QJH4iLci+OyPvksYnhoTo8Soao=;
        b=MvldOhrccwyBk6gSeTrwdez6W9pi1TT/v514brqKicsV8V2LmifFQcDLzJVju+g/Ya
         gsGaS3mKJjpgoQcCz965S4CdXHi9SZw+jJZkiz2vmGOMkK9Ost9BTOEsMnd2RWJ3w2AN
         08NUv0Ht3gkfodc1ssmeeaT2cYVaStqMx/1bGoj8WXtH9Yo3X6VAlNL4i3Qx4G9qIePD
         DjTrqcXTH07EwNGua6HJR/1+srmxCr4XCIgw4O+sYUdODDnrEC4tvGcCw7VdoIZjOMG/
         yPo2qstovjJ0cRQwicc8HEMFfKH9ZMYcbqbNJJXpHyWThFYgUACDZdlIZlH7aA3zaQ9N
         ldsA==
X-Forwarded-Encrypted: i=1; AFNElJ97XzAv/4euOeh6AGSLwDyXWRWqaRFrxyLRLEKIR2Zxzb5SWWOI80VWcnkxCwPrmNyNPnJzuXH5tDuKwQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YwJxLF/WzY2TFeDLVV6z00qRq6WZpb/z2PHfgbUlcugQT39c/xZ
	SJs3OHVSvUOJQB2Tye60onHql1oY0O7LhtLtkGgPbymkfTPZvADFhoJL
X-Gm-Gg: AfdE7cmznLdQwvHpHr4x/gRmRDzH5QCZGYH68wwnor3tthlR8kcSOk9JhXycx2LHOuB
	vDkOEhIl0ts2ocwXc032oXrWiYvTdVhB57PN9Skgp4zCD4+kXuXEFdy/Yzb4Sp3VyGId+WwnFra
	Z90JOfiLUFBorvonhyBMQ9FvAS0TBbr7aEhsT1TApCLESDnTXeT06DI8QUQFv2EUnvbxd1tg89y
	oh++jFC5+0Op1hyCv+Fhdz6q6emymXAeUWDlVMbn3XumwiPc1jC9T4tl0XYgoha3DEhEBAtzaiL
	ePeyk+qLuTpxzfyqNQSXyiTPH+udSltrZes3f/24uYMxKQWjzNqxSI2IQaqBDTDMQVfQbgfJ5R+
	rqaHqq+F3h8TE5YPNnWpzHIrNDeQS0+vq36hyUBNFDu0WQMmPpdF6FiL0Ky/voGncAt/+ugvWhd
	i8c/ZJbkI=
X-Received: by 2002:a05:6820:82c:b0:6a3:8023:f344 with SMTP id 006d021491bc7-6a38023f40bmr2648403eaf.2.1783623048208;
        Thu, 09 Jul 2026 11:50:48 -0700 (PDT)
Received: from localhost ([45.136.154.250])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a377bd9cb1sm2973603eaf.15.2026.07.09.11.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:50:47 -0700 (PDT)
Date: Thu, 9 Jul 2026 21:50:40 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hao-Qun Huang <alvinhuang0603@gmail.com>
Message-ID: <ak_tgJC8-d1HPKuV@stanley.mountain>
References: <20260704081613.434445-1-alvinhuang0603@gmail.com>
 <ak99bENMWC8saJL4@stanley.mountain>
 <20260710020644.6728.alvinhuang0603@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260710020644.6728.alvinhuang0603@gmail.com>
X-Spamd-Bar: ----
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: P3OZIKBKGQTYGD3OKGFWCOOHJWOZWRMS
X-Message-ID-Hash: P3OZIKBKGQTYGD3OKGFWCOOHJWOZWRMS
X-Mailman-Approved-At: Fri, 10 Jul 2026 10:03:14 +0000
CC: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: hid: fix SET_REPORT return value
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/P3OZIKBKGQTYGD3OKGFWCOOHJWOZWRMS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:alvinhuang0603@gmail.com,m:vireshk@kernel.org,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:from_smtp,lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email,stanley.mountain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8293E739689

On Fri, Jul 10, 2026 at 02:06:44AM +0800, Hao-Qun Huang wrote:
> On Jul 9, 2026 at 6:52 PM, Dan Carpenter <error27@gmail.com> wrote:
> > These kinds of changes require testing.  How have you tested this
> > change?
> 
> I compile-tested it (W=1, building gb-hid, greybus and hid together) and
> traced the return path by hand.  I don't have Greybus HID hardware and
> couldn't find a working emulator (gbsim has been dead since Ara), so I
> haven't run it on a live device.
> 
> The bug is that gb_hid_set_report() returns -errno on failure and len on
> success, and __gb_hid_output_raw_report() computes that into ret (even
> adding one back for the report ID byte) and then returns 0, discarding
> it.  So a successful hidraw write reports 0 bytes written and a failed
> SET_REPORT looks like success.  The GET path next to it already returns
> the count, as do usbhid, i2c-hid and uhid, so callers already handle a
> positive return and greybus HID was the only one returning 0.

The bug is not hard to understand, the issue is that this changes the
function completely...  Was nothing checking the return before?

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
