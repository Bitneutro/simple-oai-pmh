<?php
/**
 * Simple OAI-PMH 2.0 Data Provider
 * Copyright (C) 2005 Heinrich Stamerjohanns <stamer@uni-oldenburg.de>
 * Copyright (C) 2011 Jianfeng Li <jianfeng.li@adelaide.edu.au>
 * Copyright (C) 2013 Daniel Neis Araujo <danielneis@gmail.com>
 * Copyright (C) 2017 Sebastian Meyer <sebastian.meyer@opencultureconsulting.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

/**
 * This file contains all configuration you need to change according to your preferences
 * @see http://www.openarchives.org/OAI/2.0/openarchivesprotocol.htm for further explanation
 */

$config = array();

// A human readable name for the repository
$config['repositoryName'] = 'Simple OAI 2.0 Data Provider';

// Email address for contacting the repository owner
$config['adminEmail'] = 'admin@example.org';

// Do you provide 0-byte files for deleted records?
// Possible values:
//  "no" -> the repository does not maintain information about deletions
//  "transient" -> the repository maintains information about deletions, but
//                 does not guarantee them to be persistent (default)
//  "persistent" -> the repository maintains information about deletions with
//                  no time limit
$config['deletedRecord'] = 'transient';

// Metadata format, schema and namespace of your records
// (The default is OAI_DC which is also required by the OAI-PMH specification,
// but technically you can deliver any XML based data format you want.)
$config['metadataFormat'] = 'oai_dc';
$config['metadataSchema'] = 'http://www.openarchives.org/OAI/2.0/oai_dc.xsd';
$config['metadataNamespace'] = 'http://www.openarchives.org/OAI/2.0/oai_dc/';

// Directory containing the records
// (Make sure the given path is readable.)
$config['dataDirectory'] = 'data/';

// Maximum number of records to return before giving a resumption token
$config['maxRecords'] = 100;

// Path and prefix for saving resumption tokens
// (Make sure the given path is writable.)
$config['tokenPrefix'] = '/tmp/oai2-';

// Number of seconds a resumption token should be valid
$config['tokenValid'] = 86400; // 24 hours
