Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF7739AD27
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Jun 2021 23:48:23 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CFB6460F4F
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Jun 2021 21:48:22 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id CB8B260B63; Thu,  3 Jun 2021 21:48:22 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 22F6660713;
	Thu,  3 Jun 2021 21:48:20 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 4EE0160572
 for <greybus-dev@lists.linaro.org>; Thu,  3 Jun 2021 21:48:19 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 4C932606B5; Thu,  3 Jun 2021 21:48:19 +0000 (UTC)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by lists.linaro.org (Postfix) with ESMTPS id 0FD5B60572
 for <greybus-dev@lists.linaro.org>; Thu,  3 Jun 2021 21:48:16 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-171-pfXQx4cjNgmTKMZ5T25hhw-1; Thu, 03 Jun 2021 22:48:14 +0100
X-MC-Unique: pfXQx4cjNgmTKMZ5T25hhw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.18; Thu, 3 Jun 2021 22:48:13 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Thu, 3 Jun 2021 22:48:13 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Alex Elder' <elder@linaro.org>, 'Manikishan Ghantasala'
 <manikishanghantasala@gmail.com>, Alex Elder <elder@ieee.org>
Thread-Topic: [greybus-dev] [PATCH] staging: greybus: fixed the coding style, 
 labels should not be indented.
Thread-Index: AQHXV7uPElUZ9thDckyuMtjnIAGFwKsCzNHA///2ooCAABDyEA==
Date: Thu, 3 Jun 2021 21:48:13 +0000
Message-ID: <e23879ae78404be2b707b550b3029e43@AcuMS.aculab.com>
References: <20210602133659.46158-1-manikishanghantasala@gmail.com>
 <9a3878fd-3b59-76f5-ddc7-625c66f9fee8@ieee.org>
 <CAKzJ-FNW8EPX2oQd1qr5NagnvjtWwvSeuAh8DNLetj11+BJ6RA@mail.gmail.com>
 <792dd57c0ef8454497e5ae4c4534dea2@AcuMS.aculab.com>
 <e1c36fb4-ab72-0cce-f6fe-3f04125dae28@linaro.org>
In-Reply-To: <e1c36fb4-ab72-0cce-f6fe-3f04125dae28@linaro.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH] staging: greybus: fixed the coding style,
 labels should not be indented.
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: "greybus-dev@lists.linaro.org" <greybus-dev@lists.linaro.org>,
 Alex Elder <elder@kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 Johan Hovold <johan@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

From: Alex Elder
> Sent: 03 June 2021 22:46
> 
> On 6/3/21 4:22 PM, David Laight wrote:
...
> >>>> --- a/drivers/staging/greybus/gpio.c
> >>>> +++ b/drivers/staging/greybus/gpio.c
> >>>> @@ -20,9 +20,9 @@
> >>>>    struct gb_gpio_line {
> >>>>        /* The following has to be an array of line_max entries */
> >>>>        /* --> make them just a flags field */
> >>>> -     u8                      active:    1,
> >>>> -                             direction: 1,   /* 0 = output, 1 = input */
> >>>> -                             value:     1;   /* 0 = low, 1 = high */
> >>>> +     u8                      active:1,
> >>>> +                             direction:1,    /* 0 = output, 1 = input */
> >>>> +                             value:1;        /* 0 = low, 1 = high */
> >
> > Why are you even using bitfields at all?
> > If you cared about the structure size you'd not have a byte-size pad here.
> 
> Apparently I committed this, and it was part of the very first
> Greybus drivers...
> 
> These would be better defined as Booleans; there are others in
> the same structure after all.  That would have avoided the
> checkpatch problem in the first place.

Using 'u8' can be sensible.
Boolean will be 32bit.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
