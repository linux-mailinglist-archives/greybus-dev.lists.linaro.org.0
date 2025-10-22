Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B2310BFCB18
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Oct 2025 16:53:50 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1BA453F7B7
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Oct 2025 14:53:49 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	by lists.linaro.org (Postfix) with ESMTPS id 421AA3F794
	for <greybus-dev@lists.linaro.org>; Wed, 22 Oct 2025 14:53:46 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=tSrUs2mA;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.128.41 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-471131d6121so53221715e9.1
        for <greybus-dev@lists.linaro.org>; Wed, 22 Oct 2025 07:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761144825; x=1761749625; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nDzptmmA/1MAp75cor5JADx19hm032JDHcpSfga7lTw=;
        b=tSrUs2mAQ2N4inSsCdoBS49+av48Ilt7IxPIYg2Nyvs3NkIepsqieB0gpIQqHtCnec
         avgkROwmVIInURigBZ82mGb/znw2+2gHjElr/cy+IkykQU8xHV3fUpXYmDamqp/syRKN
         1tc+Z6niUeeak6jF1TToC+YGtw4A+NydkPLijBJkb5wVwgsrbmqKxvPEz95CfR4vDSvD
         vVIRQDGBVbo+ywLNXhAzpidS6SCSZs4X3UENB13Vs3g+gbVNEaLvOkDO+uRP15TYPIxj
         iycp+qu3uACXHK3fBE8Kv5DfrkAm9ONDXGZlQkqTvl7MSnjj2rCS1NmBSQMVSumNCwCj
         ugCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761144825; x=1761749625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDzptmmA/1MAp75cor5JADx19hm032JDHcpSfga7lTw=;
        b=Vye7wflOQNlFmCimc8bVcGHAxbA1QBubBNHiz7HC9KI6iEEp5Z3rIOI95ZifVBIdgu
         rQRUvn1sGw0wtg9Vk5PRJWHSkSZikPwRrwVs0XW9Fw9J4qbFnaEyS52AzFwnm04OC1fK
         TsoyLwnb1TOG+mvBir7SUy8Lbw/ZrKBN/QnNaTnIpSAoVcQujXKkKO0ghxlzn7U2u80G
         gyfTqXWBgIfiTLK/+DHkqvpjwUjWKvnJaJbtlsx8KPT3o//XGb/DwGk9PGyyAEMjxFoM
         1O+/eLCgYGYzseqn8cvLGm3knPvvIxoyYbmNa9d+CIKyRB5H8YqqSirC8ugAmXwo0RoN
         BNEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkTrdRh3sRxdZ2WJF6BCqOx8nLW5HYUs2j5zPNHKF5KBSnxOmBHOsNZw+mU/UeS4Zr/xwEwuIJhG6xMw==@lists.linaro.org
X-Gm-Message-State: AOJu0YychN70ynklwyC7DRJmRBLvGbK915AyzvfNyC4I9jvct4aNiflo
	bf5ozwmXMRKn0fzXtukfO1VcMWtrplxNpMqWrQQC8AkeUlS38ELPKENcqu5jCY3I+4AmIw==
X-Gm-Gg: ASbGnctJVf4qr7KIKokb3nZ2++yCqrPEk/QIgJzLyfwovhRN6uRCGk3gJsr22H1yIVC
	TL2rYEQ4SJsagO011bdwxiO6CjNihOwA3TR6dOHEbQT9cC/UoNqlqLCjOe8K63qD49XEiTiVToT
	l1GTta/iT9g49ufe9X3JkWJGS0cbXXESKdRvHZbf03qjITNmDJZxlO+47D17iJV/fRq91du+Faf
	ytoOnJlu5co2j9hHwnWcLGOjfjnOcXECnutJEvKFQY8WumWaFK+S52LcfJVqG4QiWoUHe4LKcsP
	q39HDxZHhbVcW0PDVibttWZlCM7Htrw9cl9IaHfNRnHPEwwCWnKEenw8xbKFNoEYsdvhZ1Ye1Y/
	LATGZtsmsEP1bD8SgMktAWuz2eziKTcsZ2GIrP+JSk3b8KH4D5mbHIgnik64xOj7vVgUcyfScbg
	rI2KJ02g==
X-Google-Smtp-Source: AGHT+IEy9aeBUo2n4dYlY/W7J/vEbPfucqkAVCkr+JTDsG/5iKnq4/KG5HqeJZjmqiE9vrFusdq3hQ==
X-Received: by 2002:a05:600c:474b:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-47117877525mr154106445e9.15.1761144824970;
        Wed, 22 Oct 2025 07:53:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475c42b567dsm47385605e9.16.2025.10.22.07.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:53:44 -0700 (PDT)
Date: Wed, 22 Oct 2025 17:53:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ayush Singh <ayush@beagleboard.org>
Message-ID: <aPjv9Xnm-grVR4rb@stanley.mountain>
References: <20251022-gb-fw-v1-1-183b18500cd5@beagleboard.org>
 <aPjIJw3ahPxnDE5Q@stanley.mountain>
 <81d8d424-ad21-490a-b071-e1b3b3564e2c@beagleboard.org>
 <aPjl7G7fmvqtgww1@stanley.mountain>
 <4d87a2ef-4cc1-4774-8716-e4a3f7f346cb@beagleboard.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4d87a2ef-4cc1-4774-8716-e4a3f7f346cb@beagleboard.org>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 421AA3F794
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWELVE(0.00)[12];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	MISSING_XM_UA(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.41:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DNSWL_BLOCKED(0.00)[196.207.164.177:received,209.85.128.41:from];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: 3JUUYK6D2X5F5OV7V7Q52ODJXQW46366
X-Message-ID-Hash: 3JUUYK6D2X5F5OV7V7Q52ODJXQW46366
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Deepak Khatri <lorforlinux@beagleboard.org>, Robert Nelson <robertcnelson@beagleboard.org>, Dhruva Gole <d-gole@ti.com>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: fw-download: Fix find firmware req
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3JUUYK6D2X5F5OV7V7Q52ODJXQW46366/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 22, 2025 at 07:56:35PM +0530, Ayush Singh wrote:
> On 10/22/25 7:40 PM, Dan Carpenter wrote:
> 
> > On Wed, Oct 22, 2025 at 07:22:49PM +0530, Ayush Singh wrote:
> > > On 10/22/25 5:33 PM, Dan Carpenter wrote:
> > > > On Wed, Oct 22, 2025 at 12:57:57PM +0530, Ayush Singh wrote:
> > > > > diff --git a/drivers/staging/greybus/fw-download.c b/drivers/staging/greybus/fw-download.c
> > > > > index 9a09bd3af79ba0dcf7efa683f4e86246bcd473a5..06f1be8f3121e29551ea8416d5ee2666339b2fe3 100644
> > > > > --- a/drivers/staging/greybus/fw-download.c
> > > > > +++ b/drivers/staging/greybus/fw-download.c
> > > > > @@ -159,7 +159,7 @@ static int exceeds_release_timeout(struct fw_request *fw_req)
> > > > >    /* This returns path of the firmware blob on the disk */
> > > > >    static struct fw_request *find_firmware(struct fw_download *fw_download,
> > > > > -					const char *tag)
> > > > > +					const char *tag, const char *format)
> > > > >    {
> > > > >    	struct gb_interface *intf = fw_download->connection->bundle->intf;
> > > > >    	struct fw_request *fw_req;
> > > > > @@ -178,10 +178,17 @@ static struct fw_request *find_firmware(struct fw_download *fw_download,
> > > > >    	}
> > > > >    	fw_req->firmware_id = ret;
> > > > > -	snprintf(fw_req->name, sizeof(fw_req->name),
> > > > > -		 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s.tftf",
> > > > > -		 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
> > > > > -		 intf->vendor_id, intf->product_id, tag);
> > > > > +	if (strnlen(format, GB_FIRMWARE_FORMAT_MAX_SIZE) == 0) {
> > > > Change this to:
> > > > 
> > > > 	if (format[0] == '\0') {
> > > > 
> > > > In the caller, the assumption that format is at least
> > > > GB_FIRMWARE_FORMAT_MAX_SIZE makes sense but in this function it
> > > > doesn't make sense.
> > > Ok, will do in the next version.
> > > 
> > > > > +		snprintf(fw_req->name, sizeof(fw_req->name),
> > > > > +			 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s",
> > > > > +			 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
> > > > > +			 intf->vendor_id, intf->product_id, tag);
> > > > > +	} else {
> > > > > +		snprintf(fw_req->name, sizeof(fw_req->name),
> > > > > +			 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s.%s",
> > > > > +			 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
> > > > > +			 intf->vendor_id, intf->product_id, tag, format);
> > > > > +	}
> > > > >    	dev_info(fw_download->parent, "Requested firmware package '%s'\n",
> > > > >    		 fw_req->name);
> > > > > @@ -225,7 +232,7 @@ static int fw_download_find_firmware(struct gb_operation *op)
> > > > >    	struct gb_fw_download_find_firmware_request *request;
> > > > >    	struct gb_fw_download_find_firmware_response *response;
> > > > >    	struct fw_request *fw_req;
> > > > > -	const char *tag;
> > > > > +	const char *tag, *format;
> > > > >    	if (op->request->payload_size != sizeof(*request)) {
> > > > >    		dev_err(fw_download->parent,
> > > > We have changed the sizeof(*request) but we haven't changed
> > > > ->payload_size so how can this ever be true?  Did you test this change?
> > > 
> > > The request originates in greybus node. The payload size here is calculate
> > > from the greybus message header. It is not a hard coded value. So as long as
> > > the node sets it correctly, it will work fine.
> > I guess, how was this working for other people then?  It seems like a
> > behavior change.
> 
> 
> Well, it is technically a breaking change, if any device was already using
> fw download protocol. With that said, I have no idea who is using greybus
> right now. And since the changes are in staging drivers, it probably is
> fine.
> 
> I don't really know if the spec came first or linux implementation. But one
> of them is currently incorrect.
> 
> Just to clarify, greybus-for-zephyr is not the original or source of truth
> implementation of greybus. I just found the inconsistency between what the
> spec says, and what Linux kernel implements and thought that spec should
> probably have higher priority.

Ok, this is a question that many people face in one way or another.

Unless you have proof that there are no users, then we have to assume that
there are users.  An example of proof would be, there is a bug which
prevents the module from probing and no one has complained for over a year.
Just because code is in staging doesn't mean there are no users.

Sometimes code is in staging because the user interface is bad, and in
that case we need to update the usespace tools to handle the new interface
as well as the old one and then we can change the kernel.  That's something
we can do for staging code, but we hate to do it and once code leaves
staging then the rules become more strict.

We don't really care about the spec, it's good to support the spec but
what we really support are users.  We can't break the code for existing
users.

So we need to add if statements to support both formats.

	if (op->request->payload_size != sizeof(*request) &&
	    op->request->payload_size != OLD_SIZE) {

etc.

regards,
dan carpenter
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
