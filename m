Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOQHBFH49GnkGQIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 01 May 2026 21:00:33 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0834AEFDD
	for <lists+greybus-dev@lfdr.de>; Fri, 01 May 2026 21:00:32 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C182B40952
	for <lists+greybus-dev@lfdr.de>; Fri,  1 May 2026 19:00:31 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	by lists.linaro.org (Postfix) with ESMTPS id 7723040432
	for <greybus-dev@lists.linaro.org>; Fri,  1 May 2026 16:10:19 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=TXsp5evB;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of error27@gmail.com designates 209.85.128.45 as permitted sender) smtp.mailfrom=error27@gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so21643195e9.2
        for <greybus-dev@lists.linaro.org>; Fri, 01 May 2026 09:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777651818; x=1778256618; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h6xC7JfImrJgetVlvK/72zwn9HkupN9sZhP69nFLTWo=;
        b=TXsp5evBnMbKMq1B8ub+Ep8a8SkBta6ZcklTKMp9fyth1MuLdMAVa8DPEdTc/ERzGG
         N/BA5KtvjB6sRXSG9o4MAUjSJT0XOoMrm2LsSe1+gaPetOh/eJC2mBbdehPWOfoyQYno
         l6Xq5En772n7cKmxJ40YwT+BiT2RNzOvYD2fyL7TPV3pzmqWzf00PQBPndPyJU3c3gWh
         0yvpZb151LhHIT59lwdLwogvtMZmEq9QkfPN/nmyfZYqvbHn0mtIEz7OBtwVUU6LYZKJ
         S4DzAhpnZZ9Ikmd0fIB0LHleEsS6EJFUHYuwp/TG+aTk38FyGzFajABgDU1jI0cXDjgR
         K6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777651818; x=1778256618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6xC7JfImrJgetVlvK/72zwn9HkupN9sZhP69nFLTWo=;
        b=mDvkrGKe0W9oFTG0KKiGEdmYrxKxG/yz3xkRS9NeK5GDat4s2PlOQSv0MFyXOS4pUW
         6Abezo8rn87ftCyJofN1WejDocD/pmo8wcQip+UdxgVDV9D+1EyfDp4f62ArFtkunPgT
         GqIeOMjucfF6xGyOIoZ3PS0myl07oJgO1yE8UJtT/fwijBB8cul+fyFJHBwZR96s3+ph
         UfVQ4aABpTg6YtAcEz4dVvlgIuBAVwfirJvJ0S0kteTLvZdwnP1Ou+MGtO0c5MgQZd+G
         3om1jhos/AowJ8RXb0eUttgC9zB5VXehsq76zRFvSsjgxE1x/16vR6Df4Gb1IUTkib8P
         1s2g==
X-Forwarded-Encrypted: i=1; AFNElJ/X8K/cvsijqjMedMkRTzMMliepB2NG/2Enz/lOw2I1Edeu0ziJvUWrwq5JeZqhxZEGnAmlGC1P+3zKkw==@lists.linaro.org
X-Gm-Message-State: AOJu0YzisfSjhnUEqbExr98nX5hsz1s+Le/y7xDj9O62sUFipUp2bY+U
	4tpUSLPmh4Ce+/NpGzjEWsmhLp+o7r8FBuJdt6aFvYMJ7Brh/RFCGxiU
X-Gm-Gg: AeBDieuhL/N7mOHgFCKIiO9Cy89ItHjTXh5abx/qY2p66SKL7EyfjMEMnqcdAyg/+T8
	U1XWucgR/ZOViGyfT0djJFxt9Fd1RJHEP+xBwIWAQTHpgpsYEz7ZB/dTG/Km5Wv/9JvBjBx7Mti
	QjPUX5UTy3T1hzR3iXQLSdKnvFgWSQKWhR8Ketvhf/QsT+HGHcbMYg0thoadU7jrDcQtkNP20ni
	vM5+XtOPSTyoaQ5DOxYFsAsogcAvLUxCyT3TZ9vVJmSyaDBw3zt0vCQJQHgBrj56q4OHx8BIRJW
	jnMrm9e+8Z0u+jhJA/zjKgslNxPPcni1pJVJaHq0HLM/RX/FSnE+GDLVWAdEpP7QNAajr+/MrSA
	L2vNZ/nFB2BOgFeGcjCsgM86MSRM5tHny85cUUEsgfHg5tsB4sHthaj29RP0SvoM3Lr3vHccwp9
	7OckaS5MsZwegM9oSd9ct8/J0dHh9jGw==
X-Received: by 2002:a05:600c:4f42:b0:48a:568f:ae6d with SMTP id 5b1f17b1804b1-48a8eb6b7d5mr56259835e9.8.1777651818277;
        Fri, 01 May 2026 09:10:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c8556sm136482475e9.4.2026.05.01.09.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 09:10:17 -0700 (PDT)
Date: Fri, 1 May 2026 19:10:12 +0300
From: Dan Carpenter <error27@gmail.com>
To: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Message-ID: <afTQZHlmMkTZDP2H@stanley.mountain>
References: <20260501144207.25211-2-shyamsunderreddypadira@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260501144207.25211-2-shyamsunderreddypadira@gmail.com>
X-Spamd-Bar: ---
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: XOQXYZLW5E4GGKEHBCK6AGRLUIPCZ3RD
X-Message-ID-Hash: XOQXYZLW5E4GGKEHBCK6AGRLUIPCZ3RD
X-Mailman-Approved-At: Fri, 01 May 2026 18:59:50 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus:add missing newline in sysfs show() output
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XOQXYZLW5E4GGKEHBCK6AGRLUIPCZ3RD/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: AF0834AEFDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[greybus-dev];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]

On Fri, May 01, 2026 at 08:12:08PM +0530, Shyam Sunder Reddy Padira wrote:
> Sysfs show() functions should return newline-terminated
> strings.Add missing newline to sysfs_emit() format string.
> 
> Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
> ----
> v2:
> -Remove "no functional changes" from the description as per
> Greg's feedback.

How do you know this doesn't break anything?

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
