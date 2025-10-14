Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D17BD9EEC
	for <lists+greybus-dev@lfdr.de>; Tue, 14 Oct 2025 16:15:29 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E122045608
	for <lists+greybus-dev@lfdr.de>; Tue, 14 Oct 2025 14:15:28 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	by lists.linaro.org (Postfix) with ESMTPS id 6976844498
	for <greybus-dev@lists.linaro.org>; Tue, 14 Oct 2025 14:15:24 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=PaBzPvEg;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.128.45 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e542196c7so33457815e9.0
        for <greybus-dev@lists.linaro.org>; Tue, 14 Oct 2025 07:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760451323; x=1761056123; darn=lists.linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5vRSRvvpcXw0lckahk40k2dwuwYW2dWayzhYRmO9OLk=;
        b=PaBzPvEgLVlUjsON/Xibqv/lbe/TALk0Vbi3sPNTtPHcJeDyNHzqHOH9Qbiy11J9Hq
         t9z0niHKiU02J/hL+ec23b4Ytgnxsd4pn+vIC3ji18QyOrvnzIWXshF/H7zNC2DPn0xn
         ZeqOr8hta1AJici+5kfXjcLFdphLER4YVYW/HOk0zuVz0pauDqFW4jpcR830qJiUClT4
         WyYj5h7/AqxVfE8VWDr+11w7MxMIqSO+5G+GAGW/u3/DamI4cFGnudOxaVTSCGdlKtG1
         GyU+7OkBVtNW23SY6Zh+Pqq0DyKSKnvWHYYbs19fCL8zmmcMg8VfU/WqGm2lN0+qDo1u
         TO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760451323; x=1761056123;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5vRSRvvpcXw0lckahk40k2dwuwYW2dWayzhYRmO9OLk=;
        b=Z3JgujUnKhqMcy2t3SFnlbSgF2FE3laQ/kSESqAU3eN36Yx6zP9JfF4V8hbtLwpS6k
         Vy11Vn3DiJZo1CnsCJoqiBRAI2EUm7pW3mkyVAIPkhCfhlT6uZ/uCN6lUsgk/oZwPcg5
         NGl7yHvoe966/HzNtBMnp/Cdt28GCOlZgkPa9Sx/nfKNpxYyXe57GHg8AmQZMD3rXUoK
         85fbAcZ+kUN7pd6btskp0CC4Vv9b2fteqe2GXeU29lf+EsUvQDnySP92+77kq4FJ+mCZ
         1rF46tORdoPsbQzKhEF4arFaNIum35yMK1A1Tmxy90U4tYS8fUkGDa5+x4E9A+MZZVbB
         hMlA==
X-Forwarded-Encrypted: i=1; AJvYcCWyST2hTOmHDWFuxbDM6by4Tm5YVzQ+txwuYrRMJxVLIowuAH5TkWlRS90cyANqZcrHYLMDmx3aK4Kp1g==@lists.linaro.org
X-Gm-Message-State: AOJu0YzbTMr6Egf1ftadR8nqoclA+lE9/4y1FB0ZPL5LPwg6Q6csTwdg
	Gj2rdBWxnunnVBnomKQZYiw3sZB32dFo8bjwoefwXljJVyFlddglkmvYuVHHf2i7jSGqFQ==
X-Gm-Gg: ASbGnct0YwreYwCJoz9xUCXlkG7wjQ1OIs7frXfGljynQ4RAFnvWPlXrTP/7HzSGK34
	kinzKy29OflFLNK8CpLQPrP8oxJ6tTdlevNQxs6+bL0oiJPAMBNie+GATFxX3ZvopUpmEii1ER/
	IkeEHTetnII/gH38V7duszFzfj+FkJkn73B9MZrIk+cAz2kh/CsH/KivB0JC0KnGfmjrMyXert5
	IZR6E7pYjX/Ow26ml6ubAAACPlUTh7f8GcSgoF5xdj82yS6exMziYToMbetf9S+x6m8sD1ac2in
	6RGzlfnPhJGd0XOA8QGiXEBcpzs0AVelEsD6MSA+7gDNbJ+SuGtNtYvaLuCOx+WsiNTv5Pj7vpv
	8kaBBW8ei5sXltFBV/2cwBo+LdKCSWxHnVsBAThtaGYcIPxdUd/bjnkSMcKPnuw==
X-Google-Smtp-Source: AGHT+IGWbodeDpSgzFoLY8qVHoIv4GluIBqFgtel/+kqrsa8p0+/YdDB49sS6YR0/0Tn+4xOCMMzQQ==
X-Received: by 2002:a05:6000:26c9:b0:425:57dd:58ca with SMTP id ffacd0b85a97d-42666aa6384mr15765996f8f.8.1760451323183;
        Tue, 14 Oct 2025 07:15:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-426ce582b39sm23589081f8f.15.2025.10.14.07.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 07:15:22 -0700 (PDT)
Date: Tue, 14 Oct 2025 17:15:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Message-ID: <aO5a9izAISpCDJrc@stanley.mountain>
References: <20251014134148.2597178-1-vivek.balachandhar@gmail.com>
 <aO5VvrKTswmfO-n9@stanley.mountain>
 <8918310c-d0aa-4e02-b9d4-9aac98b0a48f@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8918310c-d0aa-4e02-b9d4-9aac98b0a48f@gmail.com>
X-Rspamd-Queue-Id: 6976844498
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.50 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.45:from];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	URIBL_BLOCKED(0.00)[linaro.org:dkim,stanley.mountain:mid];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: OWPTR4R7EBRYDOUTCM2FYG3O7CVAM56H
X-Message-ID-Hash: OWPTR4R7EBRYDOUTCM2FYG3O7CVAM56H
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, schopin@ubuntu.com, me@abhy.me, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: documentation: replace strncpy() with strscpy_pad()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OWPTR4R7EBRYDOUTCM2FYG3O7CVAM56H/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 10:01:28AM -0400, Vivek BalachandharTN wrote:
> Yes, Dan. Nice catch. Building it with below sample change:
>=20
> memset(&intf_load.firmware_tag, 0, GB_FIRMWARE_U_TAG_MAX_SIZE);
> strncpy((char *)&intf_load.firmware_tag, firmware_tag,
> =A0 =A0 =A0 =A0 GB_FIRMWARE_U_TAG_MAX_SIZE - 1);

There isn't a need to doing the memset()...

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
