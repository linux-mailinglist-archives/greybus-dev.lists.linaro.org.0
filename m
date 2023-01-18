Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6DD671CE4
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Jan 2023 14:05:06 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 135A53ECC8
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Jan 2023 13:05:05 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	by lists.linaro.org (Postfix) with ESMTPS id 610A63EBCA
	for <greybus-dev@lists.linaro.org>; Wed, 18 Jan 2023 08:38:22 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=fzgF8kdy;
	spf=pass (lists.linaro.org: domain of error27@gmail.com designates 209.85.128.50 as permitted sender) smtp.mailfrom=error27@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so863312wmb.2
        for <greybus-dev@lists.linaro.org>; Wed, 18 Jan 2023 00:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=22BxzJ1I2g5CT4PBXC4jtXMSZii+bF3n9yE6J2j4Nb0=;
        b=fzgF8kdyThujN0e3XDBEFEVimxZI9UOjfDV0//Qk1I3gS6KDSAMYQX6VSO6y36WIK0
         42kcpq0vvvcTXiml3K/76AbVpoNxTSyXIvUVZiTysWF51Ft8Mmfo9OsJwxCPvKfWENuV
         z6DrWHId/BUBzgYSH5FHYQs/XEP5U5Thh+I7o+1Fdk1ACrWszVecl/WLe6Z1jOAuYFvh
         oRrALOxAk7XtbHwfEQhZUrr/eZjhoBVU6hHgy0g/ziKm0lNdNfx8liP3Hcr6VN380Dyh
         wyfKNCxK0lM7JuVzer5Fpotyoc6OqqnHT9KcJjcY6Hs/IhL8RS/bkw5R/K6aP6YykmRe
         Guqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=22BxzJ1I2g5CT4PBXC4jtXMSZii+bF3n9yE6J2j4Nb0=;
        b=reiSIUodaQnAENytQlHx5hi+K4Tr9nFqAQn9cw/WbNcfu2FYMVDR1tPmZVbHwPvVOw
         fUqR1QIo72/QaUR0iHl0ynFcAt1KUpVj/kSpTBhY/yn0JkfdhyBl0wDCochPmZaA+QiS
         nhrAe+Ndpca6ogtCo29Y8UF1Jn1gECFBVqitF533Sgqpy1T59jDTfhqzWlnHNH/jg7zu
         wpAHe+akRwzJb2DAPlG0ETnm9mAcn6mgSQM6lRiigVVGu2tdoUZwnbahGXdXopVxsuGS
         7Rr/4B0QRYAIh18S9+rT77PoJ3bPpQDdK1nLkLaULB4Xi51Fbk3BIuYzeLQEPl89+bc6
         vzpg==
X-Gm-Message-State: AFqh2kprEMj97tiA3Lj+Cvt2vFQ8u1jfKnzcARj1wNhbbQdoyXLXqzEU
	chgYpbbhS4plw5e+hpBbLBo=
X-Google-Smtp-Source: AMrXdXu8sggmhiVQbHcxiXko3AczajbXLKn7sftHuTG2wPYKrznfm6qkMVy2KgS5TC7GgPHQXwWbgw==
X-Received: by 2002:a05:600c:510d:b0:3da:f6ae:faa9 with SMTP id o13-20020a05600c510d00b003daf6aefaa9mr11167805wms.29.1674031101319;
        Wed, 18 Jan 2023 00:38:21 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h6-20020a05600c314600b003d99469ece1sm1297950wmo.24.2023.01.18.00.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 00:38:20 -0800 (PST)
Date: Wed, 18 Jan 2023 11:38:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: Brent Pappas <bpappas@pappasbrent.com>
Message-ID: <Y8ev+UNO0bQDoZTs@kadam>
References: <20230117152857.22141-1-bpappas@pappasbrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230117152857.22141-1-bpappas@pappasbrent.com>
X-Spamd-Result: default: False [-3.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.50:from]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 610A63EBCA
X-Spamd-Bar: ---
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: BUPDMOR23DE26775NAYJPT7WHRYAZA62
X-Message-ID-Hash: BUPDMOR23DE26775NAYJPT7WHRYAZA62
X-Mailman-Approved-At: Wed, 18 Jan 2023 13:04:43 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: gpio: Replace macro irq_data_to_gpio_chip with function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BUPDMOR23DE26775NAYJPT7WHRYAZA62/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 17, 2023 at 10:28:57AM -0500, Brent Pappas wrote:
> Replace the macro irq_data_to_gpio_chip with a static inline function to comply
> with Linux coding style standards.
> 
> Signed-off-by: Brent Pappas <bpappas@pappasbrent.com>

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
