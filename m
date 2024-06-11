Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CC6905BA6
	for <lists+greybus-dev@lfdr.de>; Wed, 12 Jun 2024 21:06:17 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 124994101A
	for <lists+greybus-dev@lfdr.de>; Wed, 12 Jun 2024 19:06:16 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	by lists.linaro.org (Postfix) with ESMTPS id E07223F32B
	for <greybus-dev@lists.linaro.org>; Tue, 11 Jun 2024 20:07:43 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=rdqwxuET;
	spf=none (lists.linaro.org: domain of brgl@bgdev.pl has no SPF policy when checking 209.85.221.44) smtp.mailfrom=brgl@bgdev.pl;
	dmarc=none
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-35f123bf735so1056426f8f.1
        for <greybus-dev@lists.linaro.org>; Tue, 11 Jun 2024 13:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718136463; x=1718741263; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dp0SmRihTKvCwUxjNzXPLTei6TKKBMfz5Eth2lbQK94=;
        b=rdqwxuETkDfaAtz44A680JJmqpPWq1hh9er5SWp98m/qbS2F4TGFi1JIooh0OYzbMS
         uilRcCN4esXLxXx4G2T0+x3gSx6Ap2IWOA3JytDvdgyguixwpXyUU1wdP5rwoB0NlHj+
         r/aonnKQptMGbdQ0GI1HeFrG4Qx7R6nhEdpLfgt8mD2elrh5ISgM1+antg71Hpplr2/c
         u7sfGfq/lX/9LO0vomg8MBExqUrBNlog9/hYIBcBbCaw4icS5pXjEBHyL1rhdzRIdebV
         RNrDA/aXT6QBXxUDSlfaBrJiipCFPmFnS5XXi+ZDxq9Qy/HIFGFDKkWySlyvT3RzBlvy
         jMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718136463; x=1718741263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dp0SmRihTKvCwUxjNzXPLTei6TKKBMfz5Eth2lbQK94=;
        b=qZltmMydowyk5CC/8zwCfNm+IlfcCCFJpvG2rqNgTl11ufS2ksftez0b1VK0wWyfUq
         Lpf6YRmqg/W5T89efzfs8nXrt66Bv/UlbbkfO4gL3fCKgV1AujXWnfwUGvTwwfx/fIc3
         tFI1/oMxOXnO7TKZ/WVxIp9P/KYLVdMmbLwyBJ+pspfDLSMJh4L4zpFCQf9VzVaph9yF
         pRcd26WSZ5c3UQ5SXpsIJWHydKqp6tuqO1306d1wjBjfgT9qesfubNfBcg24OG2gnhV0
         po3oa569UMvCL+LROg2gVIUVzoEGrF9Pu0S4m3ZFrnWrGZK2iJwMIUiOiSyOjNjU8MnA
         wzFw==
X-Forwarded-Encrypted: i=1; AJvYcCUR7H4vVGW06I4AxTPJEoMA9MRSmno6z7YG+ZDx3BkAYjwcXO6XwFJEDOeLUrHFpSNpimnaBNsA5bquMIJ+BYxUSFKVgco26OFEN/Yd
X-Gm-Message-State: AOJu0YyhY7emG2u/EW3v3O6ujgLLM3Cndw0Dhwh1ZFr8O0SMCwk/RTEe
	jAutkk83e1EPLIKs8lVBjn0+tgvfX7Cg1oKeqo2erteIzS990BCR/NY5urH/bYg=
X-Google-Smtp-Source: AGHT+IEoQVgdK2bkmsXiS1d4mTtefIV7rHj4TW1pDs5MtgccfcO59X76nJJ3KtYzp7W9fGwE8bVGRg==
X-Received: by 2002:a5d:67c6:0:b0:35f:c8d:3a25 with SMTP id ffacd0b85a97d-35f0c8d3b63mr8979277f8f.30.1718136462904;
        Tue, 11 Jun 2024 13:07:42 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:38d:e428:e1bc:56b7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f2f67b5b8sm1919562f8f.12.2024.06.11.13.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 13:07:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Davis <afd@ti.com>
Date: Tue, 11 Jun 2024 22:07:40 +0200
Message-ID: <171813645457.70902.8503975086996719219.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240610135313.142571-1-afd@ti.com>
References: <20240610135313.142571-1-afd@ti.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: E07223F32B
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.30 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_RHS_MATCH_TO(1.00)[];
	R_DKIM_ALLOW(-0.20)[bgdev-pl.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[linaro.org,bgdev.pl,lwn.net,gmail.com,kernel.org,linuxfoundation.org,ti.com];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.44:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[linaro.org:email,bgdev-pl.20230601.gappssmtp.com:dkim];
	DMARC_NA(0.00)[bgdev.pl: no valid DMARC record];
	NEURAL_HAM(-0.00)[-1.000];
	R_SPF_NA(0.00)[no SPF record];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[bgdev-pl.20230601.gappssmtp.com:+]
X-MailFrom: brgl@bgdev.pl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: OGSDVK2IKDDB7Y3FZLS4QD2YKEDIQTDI
X-Message-ID-Hash: OGSDVK2IKDDB7Y3FZLS4QD2YKEDIQTDI
X-Mailman-Approved-At: Wed, 12 Jun 2024 19:06:02 +0000
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] gpiolib: Remove data-less gpiochip_add() function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OGSDVK2IKDDB7Y3FZLS4QD2YKEDIQTDI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 10 Jun 2024 08:53:13 -0500, Andrew Davis wrote:
> GPIO chips should be added with driver-private data associated with the
> chip. If none is needed, NULL can be used. All users already do this
> except one, fix that here. With no more users of the base gpiochip_add()
> we can drop this function so no more users show up later.
> 
> 

Applied, thanks!

[1/1] gpiolib: Remove data-less gpiochip_add() function
      commit: 3ff1180a39fbc43ae69d4238e6922c57e3278910

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
