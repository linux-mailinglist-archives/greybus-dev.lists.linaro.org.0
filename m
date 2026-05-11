Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IEUDi/KAWoRjwEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 11 May 2026 14:23:11 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F8B50D94B
	for <lists+greybus-dev@lfdr.de>; Mon, 11 May 2026 14:23:10 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AF39B3F79E
	for <lists+greybus-dev@lfdr.de>; Mon, 11 May 2026 12:23:09 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	by lists.linaro.org (Postfix) with ESMTPS id 07BE03F72F
	for <greybus-dev@lists.linaro.org>; Mon, 11 May 2026 09:11:08 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=WQnaDD5y;
	spf=pass (lists.linaro.org: domain of error27@gmail.com designates 209.85.221.177 as permitted sender) smtp.mailfrom=error27@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-573a81abef0so2620390e0c.2
        for <greybus-dev@lists.linaro.org>; Mon, 11 May 2026 02:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778490667; x=1779095467; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k1ZNeudKncnWsHSK9q8cKI3Ombie5JKS7sAGEDd74u0=;
        b=WQnaDD5yExmBN5JJ561brMoRw1zQ5FxtCe9PerQQFWgQT0JTSPd/ugRQzKp0MDSPUV
         e+6s75qAI7XJ2RNRUadcqMPP+YtGH4Qy/GH6A88m6Li0RMBkVYl4Xd4yziLEmt9GW00i
         jieEUG/PSVMMZGvrHUdJYSnYeKij1JvZhYFvMvkW+IvD/rh+h0W4sjnLsv/s/VThjKhy
         P0ISWaAUWrv717PbRWGWoZiBRiXhvCw1NvMSZiR/Ed5QxvSS/VoV3lVPFHVT1lj4qjkG
         HafEUJZ7sTxCYuih61n0qwZPeL7m+zA7wgjk0YhqPi2z/IqOAsHfXjVctDDQKBHZC08j
         yaXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778490667; x=1779095467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k1ZNeudKncnWsHSK9q8cKI3Ombie5JKS7sAGEDd74u0=;
        b=a5b/Y4+MvyaPcXvsp5sY92MMOe3FmerM+zP1SczF+N5A+noTihskEhiUFJJoVwCW8/
         uEjq3Z+gWzJhx3HetmV+scZ8RsVR8mB2Rr47XA+dvSEeEjNWTVIqQ/v9MiTDtUcBSK+7
         FvDifw5ZqySPIfYhn1tm0Q2gG+hN6gWyfMh6qf/2HB3ynZT3Bni9j3MMmDj8B5Ppp26g
         vIPdCnHR6IaBOtc3VWLx+2Q3uqCnsXbI9VCkMavmsqWpO3KlBqVDMObxEf47/gVcSizE
         reJxKyDni5CprCvh8bHP5x8y3drW787LbMt3Ub/L51qRw5b07LSa/yBWr8eX/HeDyN8M
         O1Mg==
X-Forwarded-Encrypted: i=1; AFNElJ8g9bY8mZJz8Z5ZZ+dCEPt5rsJmR0h4pufrex6VbtyEqb8FNAEZxrRynIDD9UvUvPqVjWg6wcGpbclLNA==@lists.linaro.org
X-Gm-Message-State: AOJu0Yz1PQ23dW6Md0tr1MGSgcvGOqGYjM5+Mvn+IWymzbCvDYwjJBOQ
	NR4+juvF2TGC/b+XitUtJM0MnJxPzypmXfOFZTNq8YUoIF3wSeWNu6pU
X-Gm-Gg: Acq92OFLCyJ0YS22rLjXzPzXtw4mtqXD1WXKHstCjqREYE9bV5cXeg1zKF2uxXJBd06
	Vcu4oqoqXTWbnofDA8+2wFbK8fmU06ClIljrG2Bmg7Uxcim+LC4tVcWCIv+KzWgT/wEO/qaf7Yc
	1OHut/NF5LiQFS1C53RYoBj7Lsb2TKL7GeZ3xWO35Xi3UCv852t66mfUkYeqRiXJ74ZpKGb7dFK
	kHq4Wtt5AZZoJ1A+Ve5cRtx7SK+eWmzoS6zloPWfvXV8yiwlr2Kj3ekfMJvrIPj2He34+d6JDKY
	OxfbXM7TqhTF6EBejK7YkpEf5tU+rtXPobMFNvVKZJVxY4fUYVfsvPbsZSj2BHtESrGIMv4fodN
	OlRArTngEHy28gaPAxcRVwoq5bSAW6bBVd8CPaocQogRwuuBOv0RQxElgQS6dNpTDtXu05AfRaI
	E/ua/FrsoueDXR2v1IeA==
X-Received: by 2002:a05:6123:163:b0:575:352f:ead0 with SMTP id 71dfb90a1353d-575595589f7mr12946704e0c.6.1778490667476;
        Mon, 11 May 2026 02:11:07 -0700 (PDT)
Received: from localhost ([185.141.119.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-575869f2d08sm6106820e0c.0.2026.05.11.02.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:11:06 -0700 (PDT)
Date: Mon, 11 May 2026 12:11:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Message-ID: <agGdJFofiZYKqqhr@stanley.mountain>
References: <c758029d-186f-4a9f-b953-90121f43d8d8@al2klimov.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c758029d-186f-4a9f-b953-90121f43d8d8@al2klimov.de>
X-Spamd-Bar: ---
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: AT3NUKCFUTZYY4BVUHC7BHYDR46LC4VP
X-Message-ID-Hash: AT3NUKCFUTZYY4BVUHC7BHYDR46LC4VP
X-Mailman-Approved-At: Mon, 11 May 2026 12:23:06 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] Greybus audio protocols drivers: correct sscanf() return value check
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AT3NUKCFUTZYY4BVUHC7BHYDR46LC4VP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B4F8B50D94B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[greybus-dev];
	NEURAL_HAM(-0.00)[-0.992];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns,al2klimov.de:email,stanley.mountain:mid]
X-Rspamd-Action: no action

On Sun, May 10, 2026 at 08:41:43PM +0200, Alexander A. Klimov wrote:
> manager_sysfs_add_store() passes 6 pointers to sscanf(),
> but required latter to return 7 which always failed the operation.
> I corrected it to 6.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---

This needs a Fixes tag.

Fixes: 49b9137a6002 ("staging: greybus: audio: remove redundant slot field")

You need to add Pankaj Bharadiya <pankaj.bharadiya@gmail.com> to the
CC list.  Although that patch is from 10 years ago so it means no one is
using this.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
