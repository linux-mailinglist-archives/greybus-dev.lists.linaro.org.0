Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 782E49B4E24
	for <lists+greybus-dev@lfdr.de>; Tue, 29 Oct 2024 16:36:19 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9A7D9445ED
	for <lists+greybus-dev@lfdr.de>; Tue, 29 Oct 2024 15:36:18 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	by lists.linaro.org (Postfix) with ESMTPS id 98D74445ED
	for <greybus-dev@lists.linaro.org>; Tue, 29 Oct 2024 15:36:13 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=nqEfkut5;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.218.50 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a9a2cdc6f0cso750728466b.2
        for <greybus-dev@lists.linaro.org>; Tue, 29 Oct 2024 08:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730216172; x=1730820972; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Az9Dk7+EEGUZ6gjbi4dbeDEuHWYkO2/rkcRJveCLeXI=;
        b=nqEfkut5ZervY4xV8n3BwbKmFsoIMzmW1oG1LKr1W7l7XQFcpr2ZFwWy4bZCUhhhV0
         Ev78P/sd2aDNqwqStC561dP87cysih+WP/c0IbszDNjZK+ekqe6mjprLPIMe1GEhmzQA
         p/nSW13vvk/93NmpA0fSEe6N2yPWQ01iI4iFVAX3suZKGQ3EVZGp91LkUEYJ3bMt44uZ
         0iAAREKYX3zV1NC0nxzHeCnWs4i3VZi8E+T/GtVfvnzos1iSbkGVvs7U7HaHqME49Mix
         yEQ9i3vo201G5W5Ki091ie1tH18firlORAhS1m0LqtwsdUmsLgAUfCJlHPQakTFiwc8x
         uZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730216172; x=1730820972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Az9Dk7+EEGUZ6gjbi4dbeDEuHWYkO2/rkcRJveCLeXI=;
        b=BGEqphHxSdzfRDvwLV6ngiO1DuSLarhg62mRaLkXy5GYt+vV9Y8gmxmWkSG3G2hdHQ
         FMSB6E3a06odZI2iHRS6pyg7Yal/83rqj16554RE+VzgvtI3ZKwgU1IWYtZQBBlS2oPX
         vde+w7H7rKYaAxaXhUP50K2HCBHYDX1tpiqP/kONZ+8mPTzSTQ9BHgNsO030nSlnza61
         CUb3R/kodYuddKhPVvTJlG3N/ezWhcLrDg9e7UBDa10x1QITNzetcDwAZCmpHK6ggU4a
         T22136O4d0uhYbgrLrqjF7q1ekfw2e5uD8vGbR9d7RifxodaIov8/Zv1YftFj/9oyALD
         OuKg==
X-Forwarded-Encrypted: i=1; AJvYcCVv+AAmkXYk6Ww6+dOeGOd54iHUMxFlBavyT7oFffVCgQz3hk6P3XosmJ7J4gIcOtPxMR3YwvMIlsDc7w==@lists.linaro.org
X-Gm-Message-State: AOJu0Ywc7yc/8kJ7/zdKTlp6edhK/8bwuGcZKmAwheMFqQ+P+McbZG80
	W1owbUlIPhCJ8cFfSY22EthC1XHZq8RzBLEczSQckVXBrIx/nXH+NeogQ+9xo97XrQ==
X-Google-Smtp-Source: AGHT+IEU1iH/F5CZkTb1Q0OIRBjgpNI0NSgp7znzkrHlLRcaq2cgt2DVKxL54s9Ap1AXt+Hg3XFGdQ==
X-Received: by 2002:a17:906:dace:b0:a9a:38e6:2fdf with SMTP id a640c23a62f3a-a9de619bb45mr1212224866b.64.1730216172452;
        Tue, 29 Oct 2024 08:36:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f298319sm477938866b.105.2024.10.29.08.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 08:36:12 -0700 (PDT)
Date: Tue, 29 Oct 2024 18:36:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alex Elder <elder@ieee.org>
Message-ID: <90038430-3ead-405b-8a1c-69dce59004b8@stanley.mountain>
References: <20241026081153.2649890-1-yiyang13@huawei.com>
 <9ada17f8-7b3a-4bf7-8fc8-f40bf67adb33@stanley.mountain>
 <a9cfb5e6-33f4-495c-b329-7e97f626d1a1@ieee.org>
 <541d16d3-ea2e-d956-5dd9-613ede430fe5@huawei.com>
 <01caa8c5-5d7e-449c-a00d-28c81f453e41@ieee.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01caa8c5-5d7e-449c-a00d-28c81f453e41@ieee.org>
X-Spamd-Result: default: False [-6.19 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-2.59)[98.20%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.218.50:from];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_CC(0.00)[huawei.com,gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,projectara.com,lists.linaro.org,lists.linux.dev];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SENDERSCORE_REPUT_8(0.00)[209.85.218.50:from];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 98D74445ED
X-Spamd-Bar: ------
Message-ID-Hash: DAZ6JYLBIUD2AGB77GU3LF4LJLRCJMFU
X-Message-ID-Hash: DAZ6JYLBIUD2AGB77GU3LF4LJLRCJMFU
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: "yiyang (D)" <yiyang13@huawei.com>, johan@kernel.org, elder@kernel.org, ankov_svetlin@projectara.com, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, wangweiyang2@huawei.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: fix possible null-ptr-deref in gb_audio_manager_get_module()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DAZ6JYLBIUD2AGB77GU3LF4LJLRCJMFU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 29, 2024 at 10:31:14AM -0500, Alex Elder wrote:
> If you can't find any callers, none exist.  It's fine to propose
> removing the function.  And if the maintainer accepts it, it's a
> good change.

Plus in this case specifically Alex is the maintainer so you can already be
pretty sure he'll accept it.  ;)

regards,
dan carpenter
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
