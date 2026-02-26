Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COT3NE1boWmDsQQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 27 Feb 2026 09:52:29 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5FC1B4B8F
	for <lists+greybus-dev@lfdr.de>; Fri, 27 Feb 2026 09:52:29 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 29EED3FDB1
	for <lists+greybus-dev@lfdr.de>; Fri, 27 Feb 2026 08:52:28 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	by lists.linaro.org (Postfix) with ESMTPS id 6139E3F902
	for <greybus-dev@lists.linaro.org>; Thu, 26 Feb 2026 18:26:07 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=SsWYGrfv;
	spf=pass (lists.linaro.org: domain of chakrabortyshubham66@gmail.com designates 209.85.210.172 as permitted sender) smtp.mailfrom=chakrabortyshubham66@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-824484dba4dso1274320b3a.0
        for <greybus-dev@lists.linaro.org>; Thu, 26 Feb 2026 10:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772130366; x=1772735166; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSL7gDcnf5c43asbFbv4ZgcRJ5XQVgjSTUff9bWl7Rk=;
        b=SsWYGrfvxmTXhpGNlxQKmYkx1fxw2R6NEXAdhLpff3lY4oaPNeZ5KM/kr6EeP1ekBF
         3g+XBW+OBE176AeodHoDUCFFiIuQncPxr9ftydpu8UBv9cborWUUMZcN6Mz/Xju4Kynb
         dt0eJ6L18lQphIKCxscMt2NOPbP18K4mBttgl9ODDQpgPjrcXW/7Ht6mPNZwEgUtP/Zi
         JJTnfiY52CWQuGn//0EBDbOnLHeRIY1+cQfZKzmo7Bi18Db4mVV4s/GXITfFCDRO2NlY
         chpaVKFZ/yLLkAefgJzUXK04PxEL+UGkHgORR2udjJ7m0Ty3ojmeQfmoKNZlo4A5DXkM
         iabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772130366; x=1772735166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YSL7gDcnf5c43asbFbv4ZgcRJ5XQVgjSTUff9bWl7Rk=;
        b=IL6O1OfLS5xpD5/RxZOd6jSx/H5Lo4xmLVSy79mr/DLYdJcsGaLcqmBrrBf37RYZ/l
         V8SsIEOmvwypflsWErugzRwgs4eKr6gxoZUPROhcjP16v6zUxaVeE26Uc3lClifTrNrX
         6wYSW3e+cYxPlhXbjQnkljEyYazmP1joBKtxA3LyoDiAzYJfPHshp/asJ0LKoKKsLZtd
         GSxU/SjYncdt8Ccy7vpWmJa2WoTLw4QzzWK88IhJV+NpjWEGazJPI/+rrSg1KdPyXngk
         lQdIJmdGI+qRNQHu31B1UBfRMcQs8PIOudi0HrK/1BIHMhL9oZ0akTI/r16FWAvSKoRF
         2Faw==
X-Forwarded-Encrypted: i=1; AJvYcCUMhfxMqWBA8IPUg5wA6Urd3KL6ULoSWbmikReSi+9WJY1cNokt9xF8l29/IA6qOSbe2g4wHhMGNOUqwg==@lists.linaro.org
X-Gm-Message-State: AOJu0YyCehnAEy2PYfJsCcASlmHlWCg/bnHbX+a4+Esy4OA4Cne3Kh62
	AByTgh99J2i08luyDsH2xhetOqdXtDR3f8bCIvhrhdhYuaIOtno3aP3aiwG74esc8i0=
X-Gm-Gg: ATEYQzyvWx0irjOdV7mLeAWMM8+jI/9x2/E5OdT7VQaA9OusmNByHV2ZIm+BVgopvKI
	NbH+7GMUelyMxn7SAnjVWmxdRlhINLjyid0Y8eMv/2C/FVufYla3jRe/El47spa1RIxeWlSd648
	g0/zHiNarvO65JmXxjkDC+XOIizqvGyDS5SYn3kqYlvpi8arOx3mXsWEpsGo2ZPr90Gq3g46fbE
	GExKXFDrZXpFNTwKhEJgDkc854Eg4NRlmD9H2RbkYOz4hMjYFlXEO/AvBVFwn4VNd7of3WGPZcb
	rCYZ2+kQfTU2YacCOFZIjhNAtvN4wf3J1bbTvX0wNSdhHc/M40zFmy0n0n4v95/u06V+C667yAg
	DhrmHP9dFRBsHj4S6UjPk8GolYJH3XJ4oRxDNm8YdzWamp6ZUyzoHP5X+x3BcSCAkgS9AWIgFWp
	Q395mkyWopCFLoAp0TOOWbzpbvk94VgPHSgQ==
X-Received: by 2002:a05:6a00:c8d:b0:81e:af19:34bc with SMTP id d2e1a72fcca58-8274d9f4011mr33669b3a.36.1772130366275;
        Thu, 26 Feb 2026 10:26:06 -0800 (PST)
Received: from fedora ([2409:40e5:1160:7851:d9ac:d756:7e02:e043])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ff372fsm3053585b3a.31.2026.02.26.10.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:26:05 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: gregkh@linuxfoundation.org
Date: Thu, 26 Feb 2026 23:55:43 +0530
Message-ID: <20260226182543.19246-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026022506-untouched-scone-e6bb@gregkh>
References: <2026022506-untouched-scone-e6bb@gregkh>
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: chakrabortyshubham66@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: JJFRZSAZ2WO2P4DENYWYRNGUYNVZI6DB
X-Message-ID-Hash: JJFRZSAZ2WO2P4DENYWYRNGUYNVZI6DB
X-Mailman-Approved-At: Fri, 27 Feb 2026 08:52:26 +0000
CC: chakrabortyshubham66@gmail.com, dtwlin@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/2] staging: greybus: uart: convert to XArray
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JJFRZSAZ2WO2P4DENYWYRNGUYNVZI6DB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chakrabortyshubham66@gmail.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Queue-Id: 4C5FC1B4B8F
X-Rspamd-Action: no action

Understood, I'll drop this patch. Thanks for the review.

Regards,
Shubham Chakraborty
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
