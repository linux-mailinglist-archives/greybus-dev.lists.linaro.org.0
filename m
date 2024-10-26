Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E6D9B1731
	for <lists+greybus-dev@lfdr.de>; Sat, 26 Oct 2024 12:50:15 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EFC2641016
	for <lists+greybus-dev@lfdr.de>; Sat, 26 Oct 2024 10:50:13 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	by lists.linaro.org (Postfix) with ESMTPS id 23B2540F63
	for <greybus-dev@lists.linaro.org>; Sat, 26 Oct 2024 10:50:09 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=ja6WwfYI;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.221.51 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d533b5412so1968366f8f.2
        for <greybus-dev@lists.linaro.org>; Sat, 26 Oct 2024 03:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729939808; x=1730544608; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yVz5J6QwYAV8RfgyJiVOhZ6SmvE+XSupxSpNLrKom2E=;
        b=ja6WwfYIYLFePMJVGhGL9qN5G1nhrkZkT3gGDSbiasq5JTQhZ9MXHykOIl8VdECD0P
         AAchdzVoGsaWajJKO5BppLKgrFInE363ik+vXgzSv2yptzc7jyYiL29x//Xk9KgJ20Ia
         pKBabxJbB7pW+pk2Oxn1yz1vUjDtIT1GnSyLUYEWeAda4Qd+eH6rCp5IZY+stNsFpLdG
         QowhG9dZA//s9iEcN++XZM2Y+xoVzEt3SOVYXtzRDTC7Jhcc9oVnoqaaBg0BR+PvWj09
         O2x424X3rK8+XjDub7A66CclkezpYv0eN+qRxJF19FmBUkVDEzQUwcEp1lmv9OvGFvPx
         I2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729939808; x=1730544608;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVz5J6QwYAV8RfgyJiVOhZ6SmvE+XSupxSpNLrKom2E=;
        b=CnACHqrj/f/8W5sGQVsjg7xhoLEm2XCM3uAa/H9jPx4unMS+DBCsTrStlBXw2dgrtO
         cyuIjlut5zL9v7kGvl1NZH+O9QtCMmsu9rEUfMZ1XObTKZT+6CticsuLQxpTwmFh5sAS
         50Hgas1eVc3KBdQs0HMGfs4cBWda6PzadOFs+YmB2iJBoLLRqohqdARNK1yKcNQj1gLS
         9IDDy2YPBPFjpwwsfjD66W5O7xnyiImgQ2imO/mXNW00/GMA9nQ5CkJeHFtxT2tmqIN6
         u5c9NG1zfoZnMXbh3sievcAJCOAcJV7yq/PlqCcWKVgrlfgjc6twwFTneh9pmk6sdwGi
         VoGw==
X-Forwarded-Encrypted: i=1; AJvYcCUpSqc4cz/N6xMDBKnOVHAy8dY0S8Oe72wx++Mhyb8yTaJVLT4UVgRVI5aYkaovNm8jGpRInXlFQtIpxA==@lists.linaro.org
X-Gm-Message-State: AOJu0YyFEV3oBL1+XBNczbqseNvABiNuSFV8htTY4DfI4O/PSSOa5g2e
	j0mZ8PHBqh2OFgKu4YWASyj1wOyINjHrq2J9xAyA351Lw4bZE/VHnN4a2aMqbbg7bA==
X-Google-Smtp-Source: AGHT+IHO434LELRXqOVavaqsm+vfx3F+ZefaoIvzcQGEzt13HboaTw4AXDGT9tjmHJFngTmQjqnGqg==
X-Received: by 2002:a05:6000:12c5:b0:37c:c5be:1121 with SMTP id ffacd0b85a97d-380610f7bb8mr1683045f8f.9.1729939807834;
        Sat, 26 Oct 2024 03:50:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b48216sm3981056f8f.59.2024.10.26.03.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 03:50:07 -0700 (PDT)
Date: Sat, 26 Oct 2024 13:50:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yi Yang <yiyang13@huawei.com>
Message-ID: <9ada17f8-7b3a-4bf7-8fc8-f40bf67adb33@stanley.mountain>
References: <20241026081153.2649890-1-yiyang13@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241026081153.2649890-1-yiyang13@huawei.com>
X-Spamd-Result: default: False [-6.49 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-2.99)[99.95%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_CC(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,projectara.com,lists.linaro.org,lists.linux.dev,huawei.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ARC_NA(0.00)[];
	RBL_SENDERSCORE_REPUT_8(0.00)[209.85.221.51:from];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.51:from];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 23B2540F63
X-Spamd-Bar: ------
Message-ID-Hash: FJWTGXFTBAUS4P5QK77WX77UQAJS7Q74
X-Message-ID-Hash: FJWTGXFTBAUS4P5QK77WX77UQAJS7Q74
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, ankov_svetlin@projectara.com, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, wangweiyang2@huawei.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: fix possible null-ptr-deref in gb_audio_manager_get_module()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FJWTGXFTBAUS4P5QK77WX77UQAJS7Q74/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Oct 26, 2024 at 08:11:53AM +0000, Yi Yang wrote:
> The gb_audio_manager_get_module() is EXPORT_SYMBOL, and will return NULL
> when incoming parameter id < 0, fix possible null-ptr-deref by add check
> for return value.
> 
> Fixes: 8db00736d365 ("greybus: audio: Add Audio Manager")
> Signed-off-by: Yi Yang <yiyang13@huawei.com>

Where is gb_audio_manager_get_module() called from?  So far as I can see it's
never used.  Why not just delete it?

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
