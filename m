Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B8206BFC672
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Oct 2025 16:11:02 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 28B5C3F7BB
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Oct 2025 14:11:01 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	by lists.linaro.org (Postfix) with ESMTPS id C39D43F7A1
	for <greybus-dev@lists.linaro.org>; Wed, 22 Oct 2025 14:10:57 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=LQZlODpI;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.221.41 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso6515596f8f.0
        for <greybus-dev@lists.linaro.org>; Wed, 22 Oct 2025 07:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761142257; x=1761747057; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vkLs9KoLLMdMCW70UI4iz7uHdABAQO8YgtAVQOgKTXk=;
        b=LQZlODpIhmNG6LFnLTROSf1nMvdP/NjK8ZQUliU3zTGOQGwbbTI3uWg8pTN7luvGNJ
         a1uNgg7d28iBNrY9VVjvlxnkHp+1HfaMA9L/4rkUl4DsdymkkOzvVtAtO/uZy/ixjcXo
         IN4+NcokZpDLqfg+fStS74G5r1WLCOBO5tSjanEdWIX565Vnumzbt0Sxs3zsjqHGSFkO
         Pg5/4sXI4duJxBlvXagOBKKnyDOO+uVIJXrBDi8CluS+sF7HAg0bhk8ax7PXOWg7Isc6
         0eogYYOM3TFdKhjw/kp06J/dgfFrZRp3tffb1cAn+9n7G150DlVpvP9Yo7yfI9iNbzLh
         9aUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142257; x=1761747057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vkLs9KoLLMdMCW70UI4iz7uHdABAQO8YgtAVQOgKTXk=;
        b=M90C3t3F22z4p4UxBNDmEzZWQBwz03033RnJ03RJSiNII6XmbMCFi+sMqsFpC/MlTs
         +YaXLwoMY5CfPqJK++MGEIUpM7ROx80z6W1YIM8nzq8iEonXtyv4I+OKfqgiu1qsV1A+
         5QRvH3iqtQ5G6ZncZe18Z0oDrreSo9eY52049uN05ihi7qVVwspR/u+r+/63ysMtYL0P
         xtau4wNIarT484xSoBHuJuI4swI+9jCunIIKJXpsaxYYoWejNedf4UTmxSaDowpdwhOg
         wOSS8+KPBEuOdJzn0mAT66zeh05/Vtw3IraJedjJEEUaTxY6ym46vMX5i03cJ0tehs5F
         qP5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUb2ZlZIhJ/NYNsl2HSi4Dv2WGD//sernmwxIEmIfApryB+ZD/ZYDKmteY16F1LvCQau2Gm+O8e14m7fQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YxUOB5oiarMwhHXRc1c7+OohdFCryP/H38AbiDiYMzPoIbGBjxZ
	JAx4I8ZcXxfhP2PxZN8CXLdxCR9feqZ7R6V2UG0JC7lPZxupzu4mWqGTuerT6zJIYaRmYw==
X-Gm-Gg: ASbGnct0D25i9fsnCFnA+1XP5z1HhLgi0xRJoZqbZGFXe9S1x+4vbk3u1adY61mq5wZ
	74nZa7cbdtqP1VTZsRxaMEvTVVHQmhU72ET9X93AR5GhJ5Ltqkrjh36I4BUtTWQL9YhV/zYQA2Z
	qu26mIv6CdMATptoRlCSEK+AJXcKN5wSnZL+HDCmDUsalRqYQedDM5x/j+or9mGHMqdg7zmovjH
	AOrjLXtrNRER5fSqC5V8FkAtmsittbmCPiBDcVanGXyirLNIdNQegiEMINtcUrCAqLQs99l6zOg
	gsnJIKu9dK6VRVpSeNqBZE9sbmICMVwGCETgec/ImerVnBFUe/SrdI/AGjw/3WVcyRQbPzChzOd
	1Mu9ugDnFEN9t7WAG/Fe2zYD+RPuaaWkF6ShQYJCoojcRzvaqtsnY59gPwXg8QnoTqfSSX2pA4/
	8VSuLo+rvvMKh2EILehabUS9OpydQ=
X-Google-Smtp-Source: AGHT+IE6akp/2Dc2iEjje5ectRAOzvnt5Fnjh0DmNxZXmwTBAAK6Oke63zjnbBgDMPvQctvH8W4krg==
X-Received: by 2002:a5d:5849:0:b0:426:eef2:fa86 with SMTP id ffacd0b85a97d-42704d83873mr14817512f8f.11.1761142256609;
        Wed, 22 Oct 2025 07:10:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427ea5b3c65sm25232989f8f.15.2025.10.22.07.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:10:56 -0700 (PDT)
Date: Wed, 22 Oct 2025 17:10:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ayush Singh <ayush@beagleboard.org>
Message-ID: <aPjl7G7fmvqtgww1@stanley.mountain>
References: <20251022-gb-fw-v1-1-183b18500cd5@beagleboard.org>
 <aPjIJw3ahPxnDE5Q@stanley.mountain>
 <81d8d424-ad21-490a-b071-e1b3b3564e2c@beagleboard.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <81d8d424-ad21-490a-b071-e1b3b3564e2c@beagleboard.org>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C39D43F7A1
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.41:from];
	FROM_EQ_ENVFROM(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[linaro.org:dkim];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: G3MTBEPDJLVJFHZODVHOLZ2HDN3KZBKH
X-Message-ID-Hash: G3MTBEPDJLVJFHZODVHOLZ2HDN3KZBKH
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Deepak Khatri <lorforlinux@beagleboard.org>, Robert Nelson <robertcnelson@beagleboard.org>, Dhruva Gole <d-gole@ti.com>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: fw-download: Fix find firmware req
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/G3MTBEPDJLVJFHZODVHOLZ2HDN3KZBKH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 22, 2025 at 07:22:49PM +0530, Ayush Singh wrote:
> 
> On 10/22/25 5:33 PM, Dan Carpenter wrote:
> > On Wed, Oct 22, 2025 at 12:57:57PM +0530, Ayush Singh wrote:
> > > diff --git a/drivers/staging/greybus/fw-download.c b/drivers/staging/greybus/fw-download.c
> > > index 9a09bd3af79ba0dcf7efa683f4e86246bcd473a5..06f1be8f3121e29551ea8416d5ee2666339b2fe3 100644
> > > --- a/drivers/staging/greybus/fw-download.c
> > > +++ b/drivers/staging/greybus/fw-download.c
> > > @@ -159,7 +159,7 @@ static int exceeds_release_timeout(struct fw_request *fw_req)
> > >   /* This returns path of the firmware blob on the disk */
> > >   static struct fw_request *find_firmware(struct fw_download *fw_download,
> > > -					const char *tag)
> > > +					const char *tag, const char *format)
> > >   {
> > >   	struct gb_interface *intf = fw_download->connection->bundle->intf;
> > >   	struct fw_request *fw_req;
> > > @@ -178,10 +178,17 @@ static struct fw_request *find_firmware(struct fw_download *fw_download,
> > >   	}
> > >   	fw_req->firmware_id = ret;
> > > -	snprintf(fw_req->name, sizeof(fw_req->name),
> > > -		 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s.tftf",
> > > -		 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
> > > -		 intf->vendor_id, intf->product_id, tag);
> > > +	if (strnlen(format, GB_FIRMWARE_FORMAT_MAX_SIZE) == 0) {
> > Change this to:
> > 
> > 	if (format[0] == '\0') {
> > 
> > In the caller, the assumption that format is at least
> > GB_FIRMWARE_FORMAT_MAX_SIZE makes sense but in this function it
> > doesn't make sense.
> 
> Ok, will do in the next version.
> 
> > > +		snprintf(fw_req->name, sizeof(fw_req->name),
> > > +			 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s",
> > > +			 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
> > > +			 intf->vendor_id, intf->product_id, tag);
> > > +	} else {
> > > +		snprintf(fw_req->name, sizeof(fw_req->name),
> > > +			 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s.%s",
> > > +			 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
> > > +			 intf->vendor_id, intf->product_id, tag, format);
> > > +	}
> > >   	dev_info(fw_download->parent, "Requested firmware package '%s'\n",
> > >   		 fw_req->name);
> > > @@ -225,7 +232,7 @@ static int fw_download_find_firmware(struct gb_operation *op)
> > >   	struct gb_fw_download_find_firmware_request *request;
> > >   	struct gb_fw_download_find_firmware_response *response;
> > >   	struct fw_request *fw_req;
> > > -	const char *tag;
> > > +	const char *tag, *format;
> > >   	if (op->request->payload_size != sizeof(*request)) {
> > >   		dev_err(fw_download->parent,
> > We have changed the sizeof(*request) but we haven't changed
> > ->payload_size so how can this ever be true?  Did you test this change?
> 
> 
> The request originates in greybus node. The payload size here is calculate
> from the greybus message header. It is not a hard coded value. So as long as
> the node sets it correctly, it will work fine.

I guess, how was this working for other people then?  It seems like a
behavior change.

regards,
dan carpenter


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
