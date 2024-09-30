Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (unknown [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 58715989F9E
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Sep 2024 12:43:24 +0200 (CEST)
Received: from server-108-138-64-76.iad12.r.cloudfront.net (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 211DC41016
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Sep 2024 10:43:23 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	by lists.linaro.org (Postfix) with ESMTPS id F16A63F3D9
	for <greybus-dev@lists.linaro.org>; Mon, 30 Sep 2024 10:36:59 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=FSZCKh42;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.218.46 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a8d4093722bso645017066b.0
        for <greybus-dev@lists.linaro.org>; Mon, 30 Sep 2024 03:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727692619; x=1728297419; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wMdMSE9py3RjyD6QCh1eR0VuWp5bQ3RLbcnII21K+jM=;
        b=FSZCKh42lhZt6KtFCwVk7RAjzMJ9dwP09uNHvy/Syq6EFtzymeym/oQUXA6llFUaFv
         fEA0C3fc4iLdPt3Ilfs1U5RpbSx9de11OTfoGGbyMCHyw/1lOiyUCkF0qM6kQZw70oYx
         L7h21WyvvjLd9zGFUPmKial7TFxcdcuQk2YByBG+P1JKH/wU8Ta9K3koS40g1P2DsDUY
         2++pVygZTupTtDDa+9ynAnSNzDGDHch/e5vD+omKRtqcYe3F5HPTTBADzSYIoBk8ayHU
         LfkWrW1c+98UB3GRwPc/cvqSrwE79GXuSz6bKEKYnU7A1z3cUdnpxG8AuTm2MCTOboMB
         KU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727692619; x=1728297419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMdMSE9py3RjyD6QCh1eR0VuWp5bQ3RLbcnII21K+jM=;
        b=o9AcAkdzpMlsqH8kbgpQld3wzXuORKYdOiFDvAfOL6SJBtROwRVvTgRxv6aOCOlmD9
         lf0h0RfVqDlkSTnNOXdn92Tk9/xDqSilJ1Bw4MVo+kuC4PVP/+Jd9dCcbQ+h1Qk28AIS
         Mf0YUJKvQYOzYg0MKU74ERubLi+5vuadIj4vrZhIJVqOsTekCv/QMoUHK+3hT6ibgbm1
         Mf/c+28Kacm+Ci2mgCqr8o0RNOJ/ovAckrf6HBymuUD81ZNVV8hVJVmnR/yWjdCTkbb6
         HCAzYZKAarebc0/7KqSxfkBTRVtlxXOinf9rxAI8cjX35nC1K4k8gS9HF1Oq9ZpANwpR
         wWYg==
X-Forwarded-Encrypted: i=1; AJvYcCU77zK95Zk7IvyKJ4FKoyNi1hSvTYgig/rUQYLzjwA/Ka2GFNtAcwRf8F7M2WHjIXxGcNIFWVoybe+3WA==@lists.linaro.org
X-Gm-Message-State: AOJu0YwenmKpO1heF41E0zNTmu+pauCB6ZG8Vihkii0Lz5RAeQ0hmT/W
	bOiH3iCVtWf5Xu08kJCP2c7HcC4njZZYS3Jrc8PPHu6sYl8spgSpgpAf1RLm1kCYYA==
X-Google-Smtp-Source: AGHT+IHQ1cmTo4UbLbfQql8P7BUCjSn6i5rykafHKyXfrRh0KuZAMOMWuZyLvKaN1xkt7Fee6L9LCQ==
X-Received: by 2002:a17:907:781:b0:a86:894e:cd09 with SMTP id a640c23a62f3a-a93c48e80c8mr1302865466b.9.1727692618860;
        Mon, 30 Sep 2024 03:36:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2777bc4sm522635966b.14.2024.09.30.03.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 03:36:58 -0700 (PDT)
Date: Mon, 30 Sep 2024 13:36:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Qiu-ji Chen <chenqiuji666@gmail.com>
Message-ID: <bddd479b-8fa3-4e39-8ca5-f7f133a8b298@stanley.mountain>
References: <20240930101403.24131-1-chenqiuji666@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240930101403.24131-1-chenqiuji666@gmail.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: F16A63F3D9
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.03 / 15.00];
	BAYES_HAM(-2.93)[99.70%];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.218.46:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: 5FXVEQ5XUFJIMQNGLDPVUPKE7J6IWHRI
X-Message-ID-Hash: 5FXVEQ5XUFJIMQNGLDPVUPKE7J6IWHRI
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: dtwlin@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, stable@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: Fix atomicity violation in get_serial_info()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5FXVEQ5XUFJIMQNGLDPVUPKE7J6IWHRI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 30, 2024 at 06:14:03PM +0800, Qiu-ji Chen wrote:
> Atomicity violation occurs during consecutive reads of the members of 
> gb_tty. Consider a scenario where, because the consecutive reads of gb_tty
> members are not protected by a lock, the value of gb_tty may still be 
> changing during the read process. 
> 
> gb_tty->port.close_delay and gb_tty->port.closing_wait are updated
> together, such as in the set_serial_info() function. If during the
> read process, gb_tty->port.close_delay and gb_tty->port.closing_wait
> are still being updated, it is possible that gb_tty->port.close_delay
> is updated while gb_tty->port.closing_wait is not. In this case,
> the code first reads gb_tty->port.close_delay and then
> gb_tty->port.closing_wait. A new gb_tty->port.close_delay and an
> old gb_tty->port.closing_wait could be read. Such values, whether
> before or after the update, should not coexist as they represent an
> intermediate state.
> 
> This could result in a mismatch of the values read for gb_tty->minor, 
> gb_tty->port.close_delay, and gb_tty->port.closing_wait, which in turn 
> could cause ss->close_delay and ss->closing_wait to be mismatched.
> 
> To address this issue, we have enclosed all sequential read operations of 
> the gb_tty variable within a lock. This ensures that the value of gb_tty 
> remains unchanged throughout the process, guaranteeing its validity.
> 
> This possible bug is found by an experimental static analysis tool
> developed by our team. This tool analyzes the locking APIs
> to extract function pairs that can be concurrently executed, and then
> analyzes the instructions in the paired functions to identify possible
> concurrency bugs including data races and atomicity violations.
> 

Ideally a commit message should say what the bug looks like to the user.
Obviously when you're doing static analysis and not using the code, it's more
difficult to tell the impact.

I would say that this commit message is confusing and makes it seem like a
bigger deal than it is.  The "ss" struct is information that we're going to send
to the user.  It's not used again in the kernel.

Could you re-write the commit message to say something like, "Our static checker
found a bug where set serial takes a mutex and get serial doesn't.  Fortunately,
the impact of this is relatively minor.  It doesn't cause a crash or anything.
If the user races set serial and get serial there is a chance that the get
serial information will be garbage."

regards,
dan carpenter


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
