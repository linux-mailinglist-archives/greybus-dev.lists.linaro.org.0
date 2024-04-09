Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 800C889D3AD
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Apr 2024 10:00:41 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 887C743FAD
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Apr 2024 08:00:40 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	by lists.linaro.org (Postfix) with ESMTPS id 30B31400DB
	for <greybus-dev@lists.linaro.org>; Tue,  9 Apr 2024 08:00:37 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=E87HIa+s;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.208.50 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-56e6282dd72so2112543a12.3
        for <greybus-dev@lists.linaro.org>; Tue, 09 Apr 2024 01:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712649636; x=1713254436; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ONlMZGZ9RPYiJA+pih4//jtldRttSyww/CoJiXseC8=;
        b=E87HIa+sA+RaUhyfDP6jgI44aI4f/VxZYFzL5yW6pNkv+HYAyrr0NMkWsO2wkLA4RC
         veneLzI+jW/JnFaTxLu/T8SH52fO5rtmpGWCGteJKAyCtTzScsDmHYHapFUKalDyj6gU
         9ItfNcX4xLJA05oIGFsxsnYk0nni/j6vtd12HbQQ5OkM4Bz4/vXWWU1JtMBNyUPYerp2
         qu/L+t8+FRiJhKBEuFJF2X85nab0lVX8MWYBZ4IU3o4ECKShJnbysByNog5m1lWP4hOk
         4U+rt4wvgTJijjeMvMa1PxETYMsL09mV3JYoA8uASYiAbDOG5+Vp+2i+Dr+qzQpLpdE5
         wQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712649636; x=1713254436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ONlMZGZ9RPYiJA+pih4//jtldRttSyww/CoJiXseC8=;
        b=U2nuFlg9gh80em5d8YZv8axOsBDZjhLvSYX/gFTeOXIimiWXNzeuGVF0WsjpQBMAAC
         t0PpuJq/4yICt1YQRGXH2QCnSbHQlKxRaPDfwRsPIl58lgwTg5CRywDO+ny/0Flz6jRP
         wpkHtZcWvrbL6sP2awDFML7e+ttzRMXqgiZYGPIDsSaQUaxPS82JXlGB6zK8oXcqinO+
         i2CR3OBDydUmc93sN9Ho3kWKmzOEgdzlYCRNim2AU6dxSnKqPuwTl7GvoLEndDdZK6EG
         +WFF8Xy2pQ+zY2su9gYXdoi5JmleGIwTSHWB51mwkJdC11BLm/BtMeAOgGFP8IcCeYJj
         AvZA==
X-Forwarded-Encrypted: i=1; AJvYcCWQt56Gq5MzBVM9tKOFxOylRaDuJDKo7hMeVDj/acDC/JcMr/tWijTv8GYODQoRAn8TJxxUcdkirautB8dNa+EoH4zLZInscUMMzNqq
X-Gm-Message-State: AOJu0YyqiRnmgdet9rOH4VIxUNi94nyV/MkfSPZizqmWcdwrqMs5pi9e
	9YBbEN7V6izeJBD5zaf6gbf55pKPX7Zd22SE2UmM4qVcVhcJFbbwBpM0wJVStAqoUg==
X-Google-Smtp-Source: AGHT+IGxEblWAkIcMvVn/67TittUpAQ5r3yIpuR2HIFYIIXkYrL/8PqoXuJ527K8Niw97U0bA6lP0A==
X-Received: by 2002:a17:907:8690:b0:a4e:2600:3fb6 with SMTP id qa16-20020a170907869000b00a4e26003fb6mr4485405ejc.62.1712649635877;
        Tue, 09 Apr 2024 01:00:35 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id dm14-20020a170907948e00b00a4e24d259edsm5289480ejc.167.2024.04.09.01.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 01:00:35 -0700 (PDT)
Date: Tue, 9 Apr 2024 11:00:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jackson Chui <jacksonchui.qwerty@gmail.com>
Message-ID: <f851a212-4bb0-42ca-91c4-1ee44ea9ef4c@moroto.mountain>
References: <ZhRzWNiak1qOdJLL@jc-ubuntu-dev-korn-1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZhRzWNiak1qOdJLL@jc-ubuntu-dev-korn-1>
X-Rspamd-Queue-Id: 30B31400DB
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.50:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	URIBL_BLOCKED(0.00)[linaro.org:dkim,linaro.org:email,mail-ed1-f50.google.com:helo,mail-ed1-f50.google.com:rdns];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: OOMEEXQILCTLHA4XWA4RGNNMPUQSQN2P
X-Message-ID-Hash: OOMEEXQILCTLHA4XWA4RGNNMPUQSQN2P
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [Patch v2] staging: greybus: Replace gcam macros with direct dev log calls
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OOMEEXQILCTLHA4XWA4RGNNMPUQSQN2P/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 08, 2024 at 03:44:40PM -0700, Jackson Chui wrote:
> Reported by checkpatch:
> 
> CHECK: Macro argument 'gcam' may be better as '(gcam)' to avoid
> precedence issues
> 
> Inline standard calls to 'dev_*' kernel logging functions, in favor
> of 'gcam_*' macros, to clear up gcam-related logging.
> 
> Signed-off-by: Jackson Chui <jacksonchui.qwerty@gmail.com>

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
