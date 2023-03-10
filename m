Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B319E6B5572
	for <lists+greybus-dev@lfdr.de>; Sat, 11 Mar 2023 00:18:16 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CCC923F4ED
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Mar 2023 23:18:15 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	by lists.linaro.org (Postfix) with ESMTPS id 875463F4A9
	for <greybus-dev@lists.linaro.org>; Fri, 10 Mar 2023 19:15:58 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=cT0jJhdj;
	spf=pass (lists.linaro.org: domain of kamrankhadijadj@gmail.com designates 209.85.128.50 as permitted sender) smtp.mailfrom=kamrankhadijadj@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id p26so4121574wmc.4
        for <greybus-dev@lists.linaro.org>; Fri, 10 Mar 2023 11:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678475757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AqbNsTNOU67IwaiaWCAxfvEEEDh++1uXymdMW0foEhs=;
        b=cT0jJhdjcwmJq6UzC819mX2/Azk1UEB9t9n/W+tWJ6SWmbiKqZGGOWzwKRB9BFqRUu
         vJWovyAg9K6qJc2QTNYn3Oem00xTTae8WAWyHdq1NqQt7jiy54Ng/qiLFS8Dq8kUt2pG
         u6KGguRcep7kPEP9m7LOK2Gct3L63SrsJqbFXNJZYQr3YoFDaPyrZInal37N/dXH+zOR
         YorOH89iDSSJdvJZNEF2DCiybdhVPBKz1bFABBpyvemOi2hwgFYudsYqp1Atp9+egtwG
         +t+03XDV2W8kO7qWrrbQDIvvmZ5oOlEolrO/DbSLGPTc2ZFSkRX2HIWuG/8RhtbTq/LC
         SQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678475757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AqbNsTNOU67IwaiaWCAxfvEEEDh++1uXymdMW0foEhs=;
        b=e9FwC9zVFif3sEX+qM6xSnQ4Yt18Pn4YfIhIGDJBfZvZcvMMolKfdWVULif1lPg1L9
         y+pY1vPxSzojpnJCMZ18qUwV6Kis06A1HGE2rEQ/zp62G/gSrSdXeFlyXweKWeOqHz6r
         4LF9/k7seEEhe4NnWIJf/azG/2jvA6/2z8XBM6ld1YJ3a7hML57fVgpExnHqbs2cwkIO
         UbU6yRrkJYSShQnbOPptUH+KvFDix3WcDZM2wYi3YfHZgz1gUZLzhxOc2hA/eBKfOPA1
         59BWR1sjvEi7LPg2vsTnm2qFyaWYuOYl5nAeTMK/UGAVnvFGU2E+JJTYSucCSdBdZ1tv
         ZpIg==
X-Gm-Message-State: AO0yUKW5+XWlDMCk1TZ++Nq1hjnYwOXTBC/AqhVe17rdyu2DVz5IXqqK
	Gs+A8nGxr85jD2CvWJBY32c=
X-Google-Smtp-Source: AK7set+ubJCHM2ZlWoVvoojB2vEcbbw7e5ifnSEHfK8SB1s3rdsPs3+lH0WoZPup6grrhJM5pia7bw==
X-Received: by 2002:a05:600c:3b11:b0:3eb:f73a:cf89 with SMTP id m17-20020a05600c3b1100b003ebf73acf89mr3677472wms.8.1678475757388;
        Fri, 10 Mar 2023 11:15:57 -0800 (PST)
Received: from khadija-virtual-machine ([39.41.45.115])
        by smtp.gmail.com with ESMTPSA id y4-20020a05600c364400b003eb20d4d4a8sm655548wmq.44.2023.03.10.11.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 11:15:56 -0800 (PST)
Date: Sat, 11 Mar 2023 00:15:54 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Deepak R Varma <drv@mailo.com>
Message-ID: <ZAuB6hJ3pOWxnWuS@khadija-virtual-machine>
References: <ZAtkW6g6DwPg/pDp@khadija-virtual-machine>
 <ZAt4irZnVJW4zQNb@ubun2204.myguest.virtualbox.org>
 <ZAt9e8Xnd4wAnjPn@khadija-virtual-machine>
 <ZAt+wJIhq780Ms4T@ubun2204.myguest.virtualbox.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZAt+wJIhq780Ms4T@ubun2204.myguest.virtualbox.org>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 875463F4A9
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.26 / 15.00];
	DWL_DNSWL_HI(-3.50)[gmail.com:dkim];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RCVD_IN_DNSWL_HI(-0.50)[39.41.45.115:received];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	BAYES_HAM(-0.26)[73.55%];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_IN_DNSWL_NONE(0.00)[209.85.128.50:from];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.50:from];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: kamrankhadijadj@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: RGSBJEVO5IBEHHCIYLPTQEPMY32DFOQF
X-Message-ID-Hash: RGSBJEVO5IBEHHCIYLPTQEPMY32DFOQF
X-Mailman-Approved-At: Fri, 10 Mar 2023 23:17:40 +0000
CC: outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: fix exceeds line length
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/RGSBJEVO5IBEHHCIYLPTQEPMY32DFOQF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Deepak!
If I join the if condition to one line, the line length becomes 97
columns. Would that be okay?
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
