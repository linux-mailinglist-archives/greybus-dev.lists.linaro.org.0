Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B6ED2B3E2EE
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Sep 2025 14:31:56 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D48E544A4A
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Sep 2025 12:31:55 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	by lists.linaro.org (Postfix) with ESMTPS id F0C97444B4
	for <greybus-dev@lists.linaro.org>; Mon,  1 Sep 2025 12:31:05 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=JpWeKBpW;
	spf=pass (lists.linaro.org: domain of nogunix@gmail.com designates 209.85.216.44 as permitted sender) smtp.mailfrom=nogunix@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-327d55c1da5so237232a91.2
        for <greybus-dev@lists.linaro.org>; Mon, 01 Sep 2025 05:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756729865; x=1757334665; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QdiPPLZWJJB7/3u42OQnI20Eaqu3AwluA7etN42m9mo=;
        b=JpWeKBpWa7/Kp7N2yNATHjy4O77SbDfU8RA+ewNwpYr804s9G534oYaGop4iKSkjfT
         vGMQh804MtA919dchxdR1m1eoi1fU00dH7XJKgDOQ3Gq6sAlSjd0uWeMH9s8OFSw7qXL
         vKgDxs2u0w89r/6JF/hLPQqTTH77CC3bWBZCia2ycIuaucZupHNAcXxMlLSdCuXmzmpt
         bfiJJ+6XHr0pHsdYMVLxcsGxbDIfreDTZTaZNCBSA5gkVwWXAtACYe+M+7M79LEPtYr7
         A0r7lIVxypx2ALrWCiKQmbMUq9AEXFzdwHj3ir68xZap6/Scu1UHpyymevUtGxD/pSh+
         mfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756729865; x=1757334665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QdiPPLZWJJB7/3u42OQnI20Eaqu3AwluA7etN42m9mo=;
        b=Y4iCeXq+RGukfN05ANHfUSfniumj4ADSUCJLcNH/YdLiNJq00PLnpGxOF+UtOiJN1e
         6M8rGLwYyLR25H7C/PjLYa9/RcRnHYeuDUNkyF1xnxYu8s/m2tumIG6l7FuzI+NhrIdi
         jmuTqOesEEVSvjpqeg5Iehq6STjzwsFdpNMXdOIcY1oyY9XhZ7fA5Z4xYX/CV5knrlGy
         cYnkZbg9sQfDaZ23r5yfVor/gnWC0yI1y9rpr5XFMrnwvlIf/WywQPRpKRqZNL6cUeeC
         LPiAi0+LJtWr5v87Tb9TGAMKra8b0dfrZ0LJnFeBceb2oIi+/wkMZKp//Ox+v19RlapB
         RZJg==
X-Forwarded-Encrypted: i=1; AJvYcCX+Wsm9EfQPIbO6fCM1KeWaIgI6DxXt1BtLYc/H9Tqf7nzOPiMKSnvV4YT77a7ltD32YmpAfsADyqRF/w==@lists.linaro.org
X-Gm-Message-State: AOJu0YxT023i5QPX5gcOVBQaJkbbu6KgvXqBHmruqPbXz5hi1UxklCrO
	3rWItryDpbk26zX/GjHyiYA2BxbruTLjaw/0bSNpV0K3VHpD/0onAf+v
X-Gm-Gg: ASbGncsfUtmG99GmFgGj/qSvLtST2Ewc2Q+lYjfDJ+zzf/GmVJAFCGI8gYBLOsuOsOD
	mq2kMPzHiLGw7B1F4wSHHC5wDtiX+jW89fAu6cjcjlVIruLDf8zYSWyMXdjBoIvI9cINK27wqAg
	YVy09+5J3U5DckX3AWEwz64wzGvMqdfGY07MZPNTI+4EHe30lfj4Nd+DjeRulGMyHz9ZJ5jT9Ur
	Q4NjoFl1C7MImvZxntSErk54UUU+rzO3QrjqYjCHgCS6AGz45Z/rDaOVQrNZYUJxDR9WGLtu3hp
	hhcV0N8iqNqDl1Mc5htQD2iNLT1gGidSCUBC/dMLxwloGWSq4CYxIPk3/sQTmANKtZGbtmZv38X
	6vdeGeVp9X8DhRl1A
X-Google-Smtp-Source: AGHT+IHuPeIgSdm25HDXIhjWczun9s0SrO4hSzN9HThHTxxeNAPcVKH5+g+uW+k/rl8zuQL2W/L6jA==
X-Received: by 2002:a17:90b:1e11:b0:31f:11d6:ce9c with SMTP id 98e67ed59e1d1-327e666d073mr7238986a91.7.1756729864986;
        Mon, 01 Sep 2025 05:31:04 -0700 (PDT)
Received: from fedora ([2400:4050:d860:9700:8e8a:52de:86af:cfe3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd28ade38sm9252219a12.34.2025.09.01.05.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:31:04 -0700 (PDT)
Date: Mon, 1 Sep 2025 21:30:58 +0900
From: Masaharu Noguchi <nogunix@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-ID: <aLWSAiAA8Ombi0WB@fedora>
References: <20250830173850.323897-1-nogunix@gmail.com>
 <20250830173850.323897-3-nogunix@gmail.com>
 <20250830212923.GB16364@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250830212923.GB16364@pendragon.ideasonboard.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: F0C97444B4
X-Spamd-Bar: /
X-Spamd-Result: default: False [-0.41 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	BAYES_HAM(-1.31)[90.12%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.44:from];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWELVE(0.00)[17];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linuxfoundation.org,lists.linux.dev,gmail.com,animalcreek.com,kernel.org,lists.linaro.org,broadcom.com,raspberrypi.com,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-MailFrom: nogunix@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: MJO67JPTYNSZJA4QBVRY5UQSQ2MCJX3C
X-Message-ID-Hash: MJO67JPTYNSZJA4QBVRY5UQSQ2MCJX3C
X-Mailman-Approved-At: Mon, 01 Sep 2025 12:31:50 +0000
CC: linux-staging@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, dave.stevenson@raspberrypi.com, hverkuil@kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/2] staging: vc04_services: bcm2835-camera: avoid -Wformat-truncation
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MJO67JPTYNSZJA4QBVRY5UQSQ2MCJX3C/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Thanks for the explanation. I understand now that this patch is not needed.
Please drop it.

Best regards,
Masaharu Noguchi
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
