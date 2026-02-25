Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gORgHHfanmkTXgQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 12:18:15 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5BB19658D
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 12:18:14 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8455E401C7
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 11:18:13 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	by lists.linaro.org (Postfix) with ESMTPS id 0621A3F756
	for <greybus-dev@lists.linaro.org>; Wed, 25 Feb 2026 11:18:11 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b="edDp//pZ";
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.221.52 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4362197d174so4228750f8f.3
        for <greybus-dev@lists.linaro.org>; Wed, 25 Feb 2026 03:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772018290; x=1772623090; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CSSpSxGGCKDVKlBKqXysRzcuCfnzWwXAef5nbWIuSUw=;
        b=edDp//pZZ1CZX9gMPtiJPn0SZWY3UYUeHMdW5gLBgfFCYC5y7PVQEXrKmmd7O0I4Pd
         hOlpXyF94kflmPbgXA+YftTwAfEXDPpzhpxiwFY7yXPCZp/lgBIqmAC6zNPqArIN3eL8
         WRquX1viDnjtC46tGgqwn5t1vKa3XaLwGEdKrCz5NDwgrCY8X7qd4JEw1zX2+QgHIA3w
         YYPBHQcVAQPD9PTN3Z/kOaZuJB6cxKWcVRdJtCglVbU9hBe1qmfoAJV1tJD8jbalCCck
         1QmT3BewFTY7QHtMDkl8Xmu+FZLWsVcIcGj2j8mVy9mUyOCVA7PzFtc48dOeu94klYeV
         C0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772018290; x=1772623090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSSpSxGGCKDVKlBKqXysRzcuCfnzWwXAef5nbWIuSUw=;
        b=aZ9xGxkp5fSzIwQU2jS1AStz6N8/FvH2XFFFS3K8ZLXpETEanDkgAtbTakKI3w4lD3
         l+Dl8JGxznBgGoYfQg0MD3OhobDg7mOIBxCt+vZtAWiaFbGhh1/VuO2EMIPpsAiuOd/4
         z3SZLbIqx2zz0/E00j4KoCfORwXYNhS7imlXaAoCckSxShWjLHzxj39MCnVrbMhZBv+8
         kZ0ePDSNewniiTlvlS0u0N5rM85pej5v9SnucKqZT5LfHyTzFGqA6KMR5a7P7f0D+Ecu
         slvIxRdprX6aXpMhH1tU2mYGkL8CLHoSXq10SK/0TMmEoGWywYcPMJyMv7+YEmGFdsi4
         nqJg==
X-Forwarded-Encrypted: i=1; AJvYcCVrgQrzBTJgQbKoYmzm9MNKq17NDKBEyya1j9enzBpDcuSA2QyNmteNelWO3zZ3QD4Whdc5/p75inppMg==@lists.linaro.org
X-Gm-Message-State: AOJu0YwKO4pzBNPYI+LMqMkwXv4Vy2AaRRNdxp43iP/USs9DNuZfvSar
	rxyIyxxmbSDaF8n1xC8wElYCQ5dXAZWeJ1+rzGvzaIfbnSxnYlfTV1PHNRP71+HnZoAOyQ==
X-Gm-Gg: ATEYQzzWN13JyQYFz5uLMogabmkVZWiPnAw8MEgx26go562Iiyx1sU47uHUwIk2b3lc
	arigVa/0O2Eha+RbFLM3g+oUEHdJM5KEJPs4kwVlxPTdaOE3kYlE7SdpleDD3rpbHR5tXRoNU+9
	v0Hx2oP2gSxbwCCRl7dCBoHCAUry3jN6Y90uqs4gbsRqShgH3milsDhCeyGXmD5hw5RiOZIc7uo
	awcoHlaFTSk8AKHaM3QRapGCIrL58KnmtXCyWDaJOikixu7x3wqVFQZl6g788RaHTbqoUigYHIG
	rO+HsyW5ANv5h2Vn81fLJv9i8ZG6nNsBjvMerUl7SSn6MBSVaw7kCsYif7abDZLlaU+ZflQZHuH
	pCgv1p2mEiWWN+RPh10qivLA51yXmSufdQ1bCbqbOiqcfU+6rCxisKOgVQGiidHUteuTkJ4jiw3
	2oEYtJxD3o+Gd6Ypfehh2yL3RkLPc=
X-Received: by 2002:a05:6000:1883:b0:430:f463:b6bb with SMTP id ffacd0b85a97d-4396f15ada0mr29637452f8f.16.1772018289877;
        Wed, 25 Feb 2026 03:18:09 -0800 (PST)
Received: from localhost ([41.210.147.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3fc12sm31458496f8f.24.2026.02.25.03.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 03:18:09 -0800 (PST)
Date: Wed, 25 Feb 2026 14:18:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Message-ID: <aZ7aaxEWO_7gaNzY@stanley.mountain>
References: <20260225110511.107114-1-azpijr@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260225110511.107114-1-azpijr@gmail.com>
X-Spamd-Bar: ----
Message-ID-Hash: 23B6VZTCWBFVTA6QZAJOJA5QYIRZ5PG4
X-Message-ID-Hash: 23B6VZTCWBFVTA6QZAJOJA5QYIRZ5PG4
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: camera: add comment for mutex
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/23B6VZTCWBFVTA6QZAJOJA5QYIRZ5PG4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_SPAM(0.00)[0.928];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,greybus-dev-bounces@lists.linaro.org];
	R_DKIM_REJECT(0.00)[linaro.org:s=google];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: EF5BB19658D
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 12:05:06PM +0100, Jose A. Perez de Azpillaga wrote:
> diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> index 62b55bb28408..a6f3637b8871 100644
> --- a/drivers/staging/greybus/camera.c
> +++ b/drivers/staging/greybus/camera.c
> @@ -53,7 +53,7 @@ struct gb_camera {
>  	struct gb_connection *data_connection;
>  	u16 data_cport_id;
> 
> -	struct mutex mutex;
> +	struct mutex mutex; /* Protects camera state */

I'm not sure what it means, and looking at how the mutex is used I
don't feel it's accurate either.

To be honest, I rarely love these lock documentation patches...  :/
They're often really vague and sometimes seem like just guessing based
on the name.

regards,
dan carpenter

>  	enum gb_camera_state state;
> 
>  	struct {

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
