Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCjKAmD49GnkGQIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 01 May 2026 21:00:48 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AB64AF011
	for <lists+greybus-dev@lfdr.de>; Fri, 01 May 2026 21:00:47 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CB92A40971
	for <lists+greybus-dev@lfdr.de>; Fri,  1 May 2026 19:00:46 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	by lists.linaro.org (Postfix) with ESMTPS id 4411B405CF
	for <greybus-dev@lists.linaro.org>; Fri,  1 May 2026 16:53:25 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ftSiPBRO;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of error27@gmail.com designates 209.85.128.44 as permitted sender) smtp.mailfrom=error27@gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso18848675e9.2
        for <greybus-dev@lists.linaro.org>; Fri, 01 May 2026 09:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777654404; x=1778259204; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2y27sRo5ue8JWE2ijAh+vOWVcIL4DT+bsyPNoqe/DwM=;
        b=ftSiPBROG8syIp9J/BDwKtM9M5jg0kr/uNe9+PHXCWwQRRLwWwHJplCUHlcAy1cjJJ
         66a+drBzol7HLjY7po0efVCJz63mdKWsWKWDUV2cTH708Ho9+HluN5/7RLPMKAY7NDUL
         uC+I4KAf+KG94gDANtrGfi0Pae/sUyqrlTFr2sLUh/An6YP5V9clu9gCvvJmL6314eQJ
         8dU5N+a7TDABVkZfI2uuWFdLbvdfJwRMyKD5h1qzUU4hgW9LUpCXxXdqgUgug4jtORmH
         sWJInxdDOKVrBXnIBp3GwMGedKlTxHziT8q2DJWL4X9vQyWjuMXiubmWUx8FU4K+csG7
         bP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777654404; x=1778259204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2y27sRo5ue8JWE2ijAh+vOWVcIL4DT+bsyPNoqe/DwM=;
        b=c4qM6XsSmim5SakpdizTp5zfKH1QzCMM/1sB15SWWNUvGgK78o+HrOC3zbCPvENgZQ
         ADcZNk0KPAlL3Pgqp39/RS33dmZ9TDcBfsShifWHxhtxWY/no+VfeRJ3zi0QWmNrgOGa
         4yan67X6UP6ny+Xjh/S5mPJ2OB5XFYv4TtiHAFeFiI9biWAOSBuwiegmwXxMkD3KTV4O
         1wNGQclyQ5bpLzyO9jLq9zNN7Mo8KzCk/vQzC5G2Rfj/Rl6klDAYYDzzZqhx17TL0+Oe
         GXXRdt1iivn4WldYuZi4cQmfXKFrVQWu2jrReDkc3PtO4PCWO8MRbjb3BTb0xoiLdp0i
         zfHw==
X-Forwarded-Encrypted: i=1; AFNElJ8WNj2Xdb8D+hkCZi4ODAFGqgLsQmnDTCUo1vZxp/vWq90IKZg9wvc6eyAArzV0CFWXNZMc/eXI2TzzIA==@lists.linaro.org
X-Gm-Message-State: AOJu0YzBDQ7E0mRu5LTXQwdsrPULszpmOP93hjbx8LxqFJBOXGXG7Okb
	UAH1486wVtgsK5b69fkWndpok2BePAOBv1NASuYXjYWw9tK6Vng7Tmfk
X-Gm-Gg: AeBDiev4c7xAWOZCCD1RySs5NLQKQZCbpT03rbGA953DhfDDNQx2Hs2cqueYZMavJuL
	1efMx6bScGD1MWFxJGmoGAr4XbAeAwjNa8hGx1ZoatHXxCdH57+WNbR0jwHWZB2tfpTjwvh0kgr
	8Z/VUEWbFh4Lsdef95XlHGoflGcTv/NVyel5QZEfElFJSTp5LoS7Cnpt4MHPizmjTYdjjZPBMrb
	ZBonu8Bj+tAVBvz1l5CAvhcnW+cGK6jkRzMAnEb6O60qVNbDPeyll55lPqCMrTzpYGO8FqR2sMI
	q/9OOJwyJsxbGzDsIYtulhSr8C+6ZX/NhaswsITUics5itX7t84Mh8v8jvPUKKR+oe2Lo+Fb+hm
	dpGGOgckBTKboJnnCX3HAqL1j1At4blf+4slOFBcuJxLWG8DniLQsXjlM+hUJTaJlENwuUM44EC
	DTvfTeBrHq29QCzlt+UTS8NP8PxCJUhg==
X-Received: by 2002:a05:600c:4e55:b0:48a:554d:b9a2 with SMTP id 5b1f17b1804b1-48a8eb616a7mr64863775e9.6.1777654404110;
        Fri, 01 May 2026 09:53:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301ad1sm228316225e9.9.2026.05.01.09.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 09:53:23 -0700 (PDT)
Date: Fri, 1 May 2026 19:53:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Message-ID: <afTafvSmlqsVjUjn@stanley.mountain>
References: <20260501144207.25211-2-shyamsunderreddypadira@gmail.com>
 <afTQZHlmMkTZDP2H@stanley.mountain>
 <CALx+fbZ=WyQxinsX+rggvg=rAK32LQuYTFc9c0w7U92e8Uiiww@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALx+fbZ=WyQxinsX+rggvg=rAK32LQuYTFc9c0w7U92e8Uiiww@mail.gmail.com>
X-Spamd-Bar: ---
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: W5TW2HNUZBSDE7P2KBMEPVAYVH2XFPC4
X-Message-ID-Hash: W5TW2HNUZBSDE7P2KBMEPVAYVH2XFPC4
X-Mailman-Approved-At: Fri, 01 May 2026 18:59:53 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus:add missing newline in sysfs show() output
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/W5TW2HNUZBSDE7P2KBMEPVAYVH2XFPC4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B9AB64AF011
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns,stanley.mountain:mid]

On Fri, May 01, 2026 at 10:15:57PM +0530, Shyam Sunder Reddy Padira wrote:
> Hi Dan Carpenter
> 
> I have not been able to test this on hardware. I based this change on
> the standard sysfs formatting requirement as documented in
> Documentation/filesystems/sysfs.rst.
> If there is a concern that specific Greybus userspace tools are
> sensitive to the trailing newline, I can withdraw the patch. However,
> this change aligns the driver with the standard sysfs formatting used
> across the kernel.

You need to test it with the Greybus userspace tools, yes.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
