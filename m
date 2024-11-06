Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E239BE494
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Nov 2024 11:46:49 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 826D643C19
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Nov 2024 10:46:48 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	by lists.linaro.org (Postfix) with ESMTPS id A4BF540CEE
	for <greybus-dev@lists.linaro.org>; Wed,  6 Nov 2024 10:46:44 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=wi306MHL;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.218.54 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9a0f198d38so1105492766b.1
        for <greybus-dev@lists.linaro.org>; Wed, 06 Nov 2024 02:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730890004; x=1731494804; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jnvfOfDupOxyZMEu8q+2hpeE5bOttK1dIHZM5bV1S7U=;
        b=wi306MHLyqZ2CTgmrgrWyk1G3EECNpAINxPn/E7Gl0GI9LzyecD31XQhfA2Vos7Xt3
         EHpjSfgA8ED1QoAB0L3VOfX1Hh+TA04rns/10KrOx8t//5admr9hjhZZ5ZAVxRoj891L
         xyI9Ao5bubjdPKFig1IHt5B7ksGVpGE2+PsMt8Y1XE/EI3utxaBfTPYlhnbfsRlRyUHN
         avCS92PuKu3Nneng2ahFc8xpjS9aozDbRxF/T7yPhqZ+BmDL5kvjsP8ut4CTo15PYCeV
         25uJmNMD7thN2gWBpC206Y+839QSJGwCbu1dMLh/yZlMBmUZ8pqXW+Vmke5vpiMcpDTY
         VlFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730890004; x=1731494804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jnvfOfDupOxyZMEu8q+2hpeE5bOttK1dIHZM5bV1S7U=;
        b=C27bvKAtU1tdt92uT4IAkuwAGdigo5paSufo/l82ll2wS81SChFyiIugwKraJD5DmU
         NdkiUxoJa2w9KkNtX8cQaZQEb/B3o0CmKhEErmMNF51x8lLE5sM/T2iK/ud8qs6i3gXa
         5UfFWGmNdHLzGUJ9IcKwY4qOJBqfWtF8X99qSNY4SBUZbm74zWL5ljyBE2MmhkxfAB46
         0W5OdV/dbsM5LSbKtWXsRitOtfl0IREk+L3ysrAWS7XNj2zmO8dVivPL4kKlqkniFXVh
         x2wyRbRqhRCbF3rWdJ+zQEeMql/8494ZuQca/XDhm9owvCoP6tkz61mkwua1ZRgnwsjS
         IUPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLEgLTxBsMVBCEfdUe0YRIU5oHiS1BTkPsCcOycynTVFp1+WJItxJ2mjna3HHFXOooCTzyo0I5/Jm3pQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YyWCkBFy9nlKYeq4dKhUItp9TfdP4urw50aOCLIOSLbGiuJrKvp
	SuQFeJJz6m89AM2VmePeL0HL7gOOUbPb1cfKBjF4CfGoCLvyx/6pKB78C9XTYkcW0w==
X-Google-Smtp-Source: AGHT+IFLqfCVbNW7IItqNBM12Hvln8l60e4gy4+M/K4utCO4TZx6BCGSX7in4grJXnBtZUzFTWezNA==
X-Received: by 2002:a17:907:3ea3:b0:a99:d797:c132 with SMTP id a640c23a62f3a-a9e654cdcedmr2089540966b.16.1730890003621;
        Wed, 06 Nov 2024 02:46:43 -0800 (PST)
Received: from localhost ([154.14.63.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb17fa445sm259358966b.169.2024.11.06.02.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 02:46:43 -0800 (PST)
Date: Wed, 6 Nov 2024 13:46:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Qiu-ji Chen <chenqiuji666@gmail.com>
Message-ID: <35c0f989-4618-46cd-9427-61f2a37269c0@suswa.mountain>
References: <20241106095819.15194-1-chenqiuji666@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241106095819.15194-1-chenqiuji666@gmail.com>
X-Spamd-Result: default: False [-3.51 / 15.00];
	BAYES_HAM(-2.41)[97.32%];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.218.54:from];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RBL_SENDERSCORE_REPUT_8(0.00)[209.85.218.54:from];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: A4BF540CEE
X-Spamd-Bar: ---
Message-ID-Hash: BG77K7XBJ77AQDESJXT7FJUX2DZ6AOGY
X-Message-ID-Hash: BG77K7XBJ77AQDESJXT7FJUX2DZ6AOGY
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: dtwlin@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, baijiaju1990@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] greybus/uart: Fix atomicity violation in get_serial_info()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BG77K7XBJ77AQDESJXT7FJUX2DZ6AOGY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 06, 2024 at 05:58:19PM +0800, Qiu-ji Chen wrote:
> Our static checker found a bug where set_serial_info() uses a mutex, but 
> get_serial_info() does not. Fortunately, the impact of this is relatively 
> minor. It doesn't cause a crash or any other serious issues. However, if a 
> race condition occurs between set_serial_info() and get_serial_info(), 
> there is a chance that the data returned by get_serial_info() will be 
> meaningless.
> 
> Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>
> Fixes: 0aad5ad563c8 ("greybus/uart: switch to ->[sg]et_serial()")
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
